import 'dart:io';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/favoriten/favoriten_backend_service.dart';
import 'package:plate_pal/screens/gruppe/gruppe_backend_service.dart';
import 'package:plate_pal/screens/gruppe/gruppe_model.dart';
import 'package:plate_pal/screens/home/home_backend_service.dart';
import 'package:plate_pal/secrets.dart';
import 'package:plate_pal/service/backend_service_aggregator.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import '../screens/account/account_backend_service.dart';

class BackendService implements BackendServiceAggregator {
  Logger logger = Logger();
  final storageRef = FirebaseStorage.instance.ref("images");

  bool veganFilter = false;
  bool vegetarischFilter = false;
  bool glutenfreiFilter = false;

  @override
  Future<HomeServiceReturn> getAllRecipes(String uid) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    List<Recipe> recipes = [];
    final DataSnapshot snapshot =
        await ref.child("users").child(uid).child('rezepte').get();
    final DataSnapshot snapshotGroup =
        await ref.child("users").child(uid).child('gruppe').get();
    if (snapshot.exists || snapshotGroup.exists) {
      recipes.addAll(await listToRecipes(snapshot));
      recipes.addAll(await getGroupRecipes(snapshotGroup, ref));
    } else {
      logger.d("When attempting to retrieve all recipes, the database"
          " could not be accessed! Perhaps there are none available");
      return const HomeServiceReturn(recipes: []);
    }
    return HomeServiceReturn(recipes: recipes);
  }

  Future<List<Recipe>> getGroupRecipes(
      DataSnapshot snapshot, DatabaseReference ref) async {
    List<Recipe> recipes = [];
    for (DataSnapshot member in snapshot.children) {
      DataSnapshot snapshotMember =
          await ref.child("users").child(member.key!).child('rezepte').get();
      recipes.addAll(await listToRecipes(snapshotMember));
    }
    return recipes;
  }

  @override
  Future<HomeServiceReturn> filterRecipes(
      bool vegan, bool vege, bool gl, String uid) {
    veganFilter = vegan;
    vegetarischFilter = vege;
    glutenfreiFilter = gl;
    return getAllRecipes(uid);
  }

  @override
  Future<bool> firstLogin(String uid) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users').child(uid).get();
    if (snapshot.hasChild("name")) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<bool> isFavorite(String uid, String rezept) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('users').child(uid).child("favoriten").get();
    if (snapshot.hasChild(rezept)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<AccountServiceReturn> getUserName(String uid) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users').child(uid).child("name").get();
    return AccountServiceReturn(name: snapshot.value.toString());
  }

  @override
  Future<String> getUserImage({required String userId}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('users').child(userId).child("image").get();

    if (snapshot.exists) {
      return snapshot.value.toString();
    } else {
      logger.d(
          "Error while attempting to retrieve the user image, it appears that"
          " none has been uploaded yet.");
      return "";
    }
  }

  @override
  Future<void> setUserImage(
      {required String uid, required String imageString}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.child('users').child(uid).update({"image": imageString});
  }

  @override
  void createUser(String uid, String name) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.child('users/$uid').update({"name": name});
  }

  void addFavorites(String uid, String rezept, String creator) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.child('users/$uid/favoriten').update({rezept: creator});
  }

  void removeFavorites(String uid, String rezept) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.child('users/$uid/favoriten').child(rezept).remove();
  }

  Future<List<Recipe>> listToRecipes(DataSnapshot snapshot) async {
    List<Recipe> l = [];
    for (DataSnapshot element in snapshot.children) {
      l.add(await getRecipeFrom(element));
    }
    if (glutenfreiFilter || veganFilter || vegetarischFilter) {
      l = filter(l);
    }
    return l;
  }

  List<Recipe> filter(List<Recipe> l) {
    if (glutenfreiFilter) {
      l.removeWhere((element) => !element.glutenfrei);
    }
    if (veganFilter) {
      l.removeWhere((element) => !element.vegan);
    }
    if (vegetarischFilter) {
      l.removeWhere((element) => !element.vegetarisch);
    }
    return l;
  }

  Future<List<Recipe>> getFavoriteNames(String uid) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/$uid/favoriten').get();
    //Favorites are saved like: key(recipeID) -> value (creatorUID)
    List<Recipe> l = [];
    for (dynamic elemente in snapshot.children) {
      DataSnapshot element = await ref
          .child('users/${elemente.value}/rezepte/${elemente.key}')
          .get();
      if (element.value == null) {
        logger.e("element.value of fetched Favorite Recipe is null");
      } else {
        l.add(await getRecipeFrom(element));
      }
    }
    return l;
  }

  @override
  Future<FavoritenServiceReturn> getFavorites(String uid) async {
    List<Recipe> l = await getFavoriteNames(uid);
    if (glutenfreiFilter || veganFilter || vegetarischFilter) {
      l = filter(l);
    }
    return FavoritenServiceReturn(recipes: l);
  }

  @override
  Future<FavoritenServiceReturn> filterFavorites(
      String id, bool vegan, bool vege, bool gl) {
    veganFilter = vegan;
    vegetarischFilter = vege;
    glutenfreiFilter = gl;
    return getFavorites(id);
  }

  @override
  Future<GruppeServiceReturn> getGroupMembers(String uid) async {
    List<Member> list = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/$uid/gruppe').get();
    for (dynamic element in snapshot.children) {
      DataSnapshot snaphotMember =
          await ref.child('users/${element.key}').get();
      String name = snaphotMember.child("name").value.toString();
      String imageName = snaphotMember.child("image").value.toString();
      if (imageName == "null") {
        imageName =
            "https://firebasestorage.googleapis.com/v0/b/platepal-60ea4.appspot.com/o/images%2Fplaceholder.png?alt=media&token=80f4ccf4-1b8e-48a1-b5dd-4eeec66359cf";
      }
      String image = await FirebaseStorage.instance
          .ref("userImages")
          .child(imageName)
          .getDownloadURL();
      int ammount = snaphotMember.child("rezepte").children.length;
      list.add(Member(
          name: name,
          image: image,
          ammount: ammount,
          id: element.key.toString()));
    }
    return GruppeServiceReturn(members: list);
  }

  @override
  Future<bool> addNewMember(String id, String ownId) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    DataSnapshot snapshot = await ref.child('users/$id').get();
    if (id == ownId) {
      return false;
    }
    if (!snapshot.exists) {
      return false;
    }
    await ref.child('users/$ownId/gruppe').update({id: true});
    return true;
  }

  @override
  Future<bool> removeMember(String id, String ownId) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    DataSnapshot snapshot = await ref.child('users/$ownId/gruppe/$id').get();
    if (!snapshot.exists) {
      return false;
    }
    await ref.child('users/$ownId/gruppe/$id').remove();
    DataSnapshot snapshotFavorites =
        await ref.child('users/$ownId/favoriten').get();
    for (DataSnapshot favorit in snapshotFavorites.children) {
      if (favorit.value.toString() == id) {
        await ref.child('users/$ownId/favoriten/${favorit.key}').remove();
      }
    }

    return true;
  }

  Future<Recipe> getRecipeFrom(DataSnapshot element) async {
    return Recipe(
      id: element.key.toString(),
      creator: element.child("creator").value.toString(),
      title: element.child("title").value.toString(),
      description: element.child("description").value.toString(),
      guideText: element.child("guideText").value as List<dynamic>,
      ingredients: element.child("ingredients").value as List<dynamic>,
      attachments: List<String>.from(
          element.child("attachments").value as List<dynamic>? ?? []),
      image: element.child("image").value.toString(),
      vegan: element.child("vegan").value as bool,
      vegetarisch: element.child("vegetarisch").value as bool,
      glutenfrei: element.child("glutenfrei").value as bool,
      webURL: (element.child("webURL").value) != null
          ? element.child("webURL").value.toString()
          : null,
      isSubscription: element.child("isSubscription").value as bool,
      privateRecipe: element.child("privateRecipe").value as bool,
    );
  }

  @override
  Future<void> pushRecipe(Recipe recipe, String uid, bool isEdit) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("users/$uid/rezepte/");
    final newPostKey = isEdit
        ? recipe.id
        : FirebaseDatabase.instance.ref().child('posts').push().key;
    ref.child(newPostKey!).update(recipe.toJson());
    logger.d("created recipe with id:$newPostKey");
    ref.child(newPostKey).update({"id": newPostKey});
  }

  @override
  Future<String> rawRecipeFromImage(File file) async {
    InputImage inputImage = InputImage.fromFile(file);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    String rawRecipe = recognizedText.text;
    textRecognizer.close();
    return rawRecipe;
  }

  @override
  Future<Recipe> recipeFromGPT(String rezept) async {
    String prompt = "$promptOne\n$rezept\n$promptTwo";
    logger.d(prompt);
    OpenAI.apiKey = openAiKey;
    final chatCompletion = await OpenAI.instance.chat.create(
      presencePenalty: -2.0,
      model: 'gpt-3.5-turbo',
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: prompt,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );
    String jsonString = chatCompletion.choices.first.message.content;
    logger.d("Rezept von GPT");
    Map<String, dynamic> json = jsonDecode(jsonString);
    logger.d(json);
    Recipe recipe = Recipe(
        id: "",
        creator: "",
        isSubscription: false,
        privateRecipe: false,
        image: "",
        title: json["title"],
        description: json["description"],
        guideText: json["guideText"],
        ingredients: json["ingredients"],
        vegetarisch: false,
        vegan: false,
        glutenfrei: false,
        attachments: [],
        webURL: "");
    return recipe;
  }

  @override
  ErstellenModel recipeToErstellenModel(Recipe recipe, {bool edit = false}) {
    List<Ingredient> castedIngredients = [];
    try {
      for (dynamic i in recipe.ingredients) {
        Map<String, dynamic> json = Map<String, dynamic>.from(i);
        castedIngredients.add(Ingredient.fromJson(json));
      }
    } catch (e) {
      debugPrint("Ingredients sind kein Json, versuche 2. Methode");
      for (Ingredient i in recipe.ingredients) {
        castedIngredients.add(i);
      }
    }
    return ErstellenModel(
        id: recipe.id,
        isImport: true,
        name: recipe.title,
        requiredIngredients: castedIngredients,
        steps: recipe.guideText.map((item) => item as String).toList(),
        description: recipe.description,
        webURL: recipe.webURL ?? "",
        glutenfrei: recipe.glutenfrei,
        attachments: recipe.attachments ?? [],
        vegan: recipe.vegan,
        vegetarisch: recipe.vegan,
        nameNotSet: false,
        ingridientNotSet: false,
        stepsNotSet: false,
        descriptionNotSet: false,
        urlInvalid: false,
        isEdit: edit,
        image: recipe.image);
  }

  String getFileExtensionFromUrl(String url) {
    Uri uri = Uri.parse(url);
    String path = uri.path;
    int extensionIndex = path.lastIndexOf('.');
    if (extensionIndex != -1 && extensionIndex < path.length - 1) {
      return path.substring(extensionIndex + 1);
    }
    return "";
  }

  Future<Uint8List> readNetworkImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load network image: $imageUrl');
    }
  }

  @override
  void deleteRecipe(Recipe recipe) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    if (recipe.image != "") {
      FirebaseStorage.instance.refFromURL(recipe.image).delete();
    }
    ref
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('rezepte')
        .child(recipe.id)
        .remove();
  }

  @override
  Future<void> deleteAccount({required String userId}) async {
    try {
      FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      logger.e(e);
    }
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    ref
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .update({"deleted": true});
  }
}
