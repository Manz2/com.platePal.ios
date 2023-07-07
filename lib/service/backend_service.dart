import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:plate_pal/screens/details/details_backend_service.dart';
import 'package:plate_pal/screens/details/details_model.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/favoriten/favoriten_backend_service.dart';
import 'package:plate_pal/screens/gruppe/gruppe_backend_service.dart';
import 'package:plate_pal/screens/gruppe/gruppe_model.dart';
import 'package:plate_pal/screens/home/home_backend_service.dart';
import 'package:plate_pal/secrets.dart';
import 'package:plate_pal/service/backend_service_aggregator.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:logger/logger.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../screens/account/account_backend_service.dart';

class BackendService implements BackendServiceAggregator {
  Logger logger = Logger();
  final storageRef = FirebaseStorage.instance.ref("images");

  bool veganFilter = false;
  bool vegetarischFilter = false;
  bool glutenfreiFilter = false;

  //Home
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
      logger.d(
          "When attempting to retrieve all recipes, the database could not be accessed! Perhaps there are none available");
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
  //!Home

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

  //Account Service
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
          "Error while attempting to retrieve the user image, it appears that none has been uploaded yet.");
      return "";
    }
  }

  @override
  Future<void> setUserImage(
      {required String uid, required String imageString}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.child('users').child(uid).update({"image": imageString});
  }
  //!AccountService

  @override
  void createUser(String uid, String name) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.child('users/' + uid).update({"name": name});
  }

  void addFavorites(String uid, String rezept, String creator) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.child('users/' + uid + '/favoriten').update({rezept: creator});
  }

  void removeFavorites(String uid, String rezept) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.child('users/' + uid + '/favoriten').child(rezept).remove();
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
    final snapshot = await ref.child('users/' + uid + '/favoriten').get();
    //Favorites are saved like: key(recipeID) -> value (creatorUID)
    List<Recipe> l = [];
    for (dynamic elemente in snapshot.children) {
      DataSnapshot element = await ref
          .child('users/' +
              elemente.value.toString() +
              '/rezepte/' +
              elemente.key.toString())
          .get(); //THE ISSUE IS THAT element.value == null
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
  Future<DetailsServiceReturn> getRecipe(String id, String uid) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('users/' + uid + '/rezepte').child(id).get();
    if (snapshot.exists) {
      return DetailsServiceReturn(recipe: await getRecipeFrom(snapshot));
    } else {
      logger.e(
          "Failed to access the database while attempting to retrieve the recipe!");
      return DetailsServiceReturn(recipe: emptyRecipe());
    }
  }

  @override
  Future<GruppeServiceReturn> getGroupMembers(String uid) async {
    List<Member> list = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/' + uid + '/gruppe').get();
    for (dynamic element in snapshot.children) {
      DataSnapshot snaphotMember =
          await ref.child('users/' + element.key.toString()).get();
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
    DataSnapshot snapshot = await ref.child('users/' + id).get();
    if (id == ownId) {
      return false;
    }
    if (!snapshot.exists) {
      return false;
    }
    await ref.child('users/' + ownId + '/gruppe').update({id: true});
    return true;
  }

  @override
  Future<bool> removeMember(String id, String ownId) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    DataSnapshot snapshot =
        await ref.child('users/' + ownId + '/gruppe/' + id).get();
    if (!snapshot.exists) {
      return false;
    }
    await ref.child('users/' + ownId + '/gruppe/' + id).remove();
    DataSnapshot snapshotFavorites =
        await ref.child('users/' + ownId + '/favoriten').get();
    for (DataSnapshot favorit in snapshotFavorites.children) {
      if (favorit.value.toString() == id) {
        await ref
            .child('users/' + ownId + '/favoriten/' + favorit.key.toString())
            .remove();
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
  Future<bool> updateRecipe(Recipe recipe, String uid) async {
    pushRecipe(recipe, uid, true);
    return true;
  }

  @override
  Future<void> pushRecipe(Recipe recipe, String uid, bool isEdit) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child('users/' + uid + "/rezepte/");
    final newPostKey = isEdit
        ? recipe.id
        : FirebaseDatabase.instance.ref().child('posts').push().key;
    ref.child(newPostKey!).update(recipe.toJson());
    logger.d("created recipe with id:" + newPostKey);
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
    String p1 = "Hier ist ein Rezept beschrieben:\n $rezept";
    String p2 = '''
    Hier ist eine beispielhafte Darstellung, wie ein Rezept im JSON Format aussehen soll:

    {
    "title": "Titel",
    "description": "beschreibung",
    "guideText": [
    "Zwiebeln schneiden",
    "Tomate schneiden"
    ],
    "ingredients": [
    {
    "amount": "1 Stück",
    "name": "Tomate"
    },
    {
    "amount": "1 Stück",
    "name": "Zwiebeln"
    }
    ]
    }
    
    Suche  folgende  Elemente im FLießtext und trage sie im JSON ein:
    Identifiziere falls möglich eine Kurzbeschreibung und trage es unter description ein.
    Identifiziere falls möglich die Anleitung zur zubereitung und trage sie unter guideText ein.
    Identifiziere falls möglich die Zutatenund trage sie unter ingredients ein.
    Identifiziere falls möglich den Namen des Rezepts und trage ihn unter title ein.
    Wichtig: Antworte nur mit dem neuen JSON String, der die Informationen aus dem Fließtext enthält, keine Erklärung."
    ''';
    String prompt = p1 + p2;
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
    logger.e("Rezept von GPT");
    Map<String, dynamic> json = jsonDecode(jsonString);
    logger.e(json);
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
  Future<void> toggleFavorite(
      String id, bool isCurrentlyFavorite, String creator) async {
    if (isCurrentlyFavorite) {
      removeFavorites(FirebaseAuth.instance.currentUser!.uid, id);
    } else {
      addFavorites(FirebaseAuth.instance.currentUser!.uid, id, creator);
    }
  }
}
