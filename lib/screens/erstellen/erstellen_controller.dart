import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/erstellen/erstellen_backend_service.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/erstellen/erstellen_view.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import 'package:plate_pal/ui-kit/error_dialog_choice.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uuid/uuid.dart';
import '../account/account_controller.dart';

class ErstellenControllerImplementation extends ErstellenController {
  final ErstellenBackendService _backendService;
  final MyAppNavigationService _navigationService;
  ErstellenControllerImplementation({
    ErstellenModel? model,
    required ErstellenBackendService backendService,
    required MyAppNavigationService navigationService,
  })  : _backendService = backendService,
        _navigationService = navigationService,
        super(model ??
            const ErstellenModel(
                id: '',
                name: '',
                description: '',
                webURL: '',
                requiredIngredients: [],
                attachments: [],
                steps: [],
                glutenfrei: false,
                vegan: false,
                vegetarisch: false,
                image: "",
                nameNotSet: false,
                ingridientNotSet: false,
                stepsNotSet: false,
                descriptionNotSet: false,
                urlInvalid: false,
                isImport: false,
                isEdit: false));

  @override
  void setModel(ErstellenModel? model) {
    state = model ?? state;
  }

  @override
  void setTitle(String name) {
    state = state.copyWith(name: name);
  }

  @override
  void setDescription(String desc) {
    state = state.copyWith(description: desc);
  }

  @override
  void setlink(String link) {
    state = state.copyWith(webURL: link);
  }

  @override
  bool isValidUrl(String url) {
    return Uri.tryParse(url)?.hasScheme == true;
  }

  @override
  void setGlutenfrei(bool? glut) {
    if (glut != null) {
      state = state.copyWith(glutenfrei: glut);
    }
  }

  @override
  void setVegan(bool? vegan) {
    if (vegan != null) {
      state = state.copyWith(vegan: vegan);
    }
  }

  @override
  void setVegetarisch(bool? veggie) {
    if (veggie != null) {
      state = state.copyWith(vegetarisch: veggie);
    }
  }

  @override
  void addZutat(Ingredient zutat) {
    List<Ingredient> tmp = List<Ingredient>.from(state.requiredIngredients);
    tmp.add(zutat);
    state = state.copyWith(requiredIngredients: tmp);
  }

  @override
  void deleteZutat(Ingredient zutat) {
    List<Ingredient> tmp = List<Ingredient>.from(state.requiredIngredients);
    tmp.remove(zutat);
    state = state.copyWith(requiredIngredients: tmp);
  }

  @override
  void addStep(String step) {
    List<String> tmp = List<String>.from(state.steps);
    tmp.add(step);
    state = state.copyWith(steps: tmp);
    logger.d("add ${state.steps}");
  }

  @override
  void deleteStep(String step) {
    List<String> tmp = List<String>.from(state.steps);
    tmp.remove(step);
    state = state.copyWith(steps: tmp);
    logger.d("delete ${state.steps}");
  }

  @override
  void insertStep(int index, String step) {
    List<String> tmp = List<String>.from(state.steps);
    tmp.insert(index, step);
    state = state.copyWith(steps: tmp);
    logger.d("insert ${state.steps}");
  }

  @override
  bool createRecipe(BuildContext context) {
    bool oneNotSet = false;
    if (state.name == "") {
      state = state.copyWith(nameNotSet: true);
      oneNotSet = true;
    } else {
      state = state.copyWith(nameNotSet: false);
    }
    if (state.description == "") {
      state = state.copyWith(descriptionNotSet: true);
      oneNotSet = true;
    } else {
      state = state.copyWith(descriptionNotSet: false);
    }
    if (state.requiredIngredients.isEmpty) {
      state = state.copyWith(ingridientNotSet: true);
      oneNotSet = true;
    } else {
      state = state.copyWith(ingridientNotSet: false);
    }
    if (state.steps.isEmpty) {
      state = state.copyWith(stepsNotSet: true);
      oneNotSet = true;
    } else {
      state = state.copyWith(stepsNotSet: false);
    }
    if (oneNotSet) {
      return false;
    }
    if (!isValidUrl(state.webURL!) && state.webURL!.isNotEmpty) {
      state = state.copyWith(urlInvalid: true);
      final snackBar = SnackBar(
        content: Text(FlutterI18n.translate(context, "create.noValidUrl")),
        action: SnackBarAction(
          label: FlutterI18n.translate(context, "details.ok"),
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    } else {
      state = state.copyWith(urlInvalid: false);
    }

    String uid = FirebaseAuth.instance.currentUser!.uid;
    List<dynamic> zutaten = [];
    for (Ingredient ingredient in state.requiredIngredients) {
      zutaten.add(ingredient.toJson());
    }
    Recipe recipe = Recipe(
        id: state.id,
        creator: uid,
        isSubscription: false,
        privateRecipe: false,
        image: state.image,
        title: state.name,
        description: state.description,
        guideText: state.steps,
        ingredients: zutaten,
        vegetarisch: state.vegetarisch,
        vegan: state.vegan,
        glutenfrei: state.glutenfrei,
        attachments: state.attachments,
        webURL: (state.webURL == "") ? null : state.webURL);
    _backendService.pushRecipe(recipe, uid, state.isEdit);

    return true;
  }

  @override
  Future<bool> addImage(String image) async {
    Uuid uuid = const Uuid();
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(withData: true, allowMultiple: false, type: FileType.image);

    if (result != null) {
      if (result.files.single.size >= 5000000) {
        return false;
      }

      Uint8List uploadfile = result.files.single.bytes!;
      String extension = result.files.single.extension!;
      String? name = uuid.v1();
      String fileName = "$name.$extension";

      if (image != "") {
        FirebaseStorage.instance.refFromURL(image).delete();
      }

      await FirebaseStorage.instance
          .ref("images")
          .child(fileName)
          .putData(uploadfile);
      String downloadUrl = await FirebaseStorage.instance
          .ref("images")
          .child(fileName)
          .getDownloadURL();

      state = state.copyWith(image: downloadUrl);
      return true;
    } else {
      logger.d("Failed to get Image");
      return false;
    }
  }

  @override
  bool getIngridientsNotSet() {
    return state.ingridientNotSet;
  }

  @override
  bool getStepsNotSet() {
    return state.stepsNotSet;
  }

  @override
  Future<bool> deleteAll(BuildContext context) async {
    if (state.name != "" ||
        state.description != "" ||
        state.requiredIngredients.isNotEmpty ||
        state.steps.isNotEmpty ||
        state.webURL != "" ||
        state.image != "") {
      final bool? result = await ErrorDialogChoice(
              ok: FlutterI18n.translate(context, "create.delete"),
              dismiss: FlutterI18n.translate(context, "create.keep"),
              message: FlutterI18n.translate(context, "create.deleteMessage"),
              title: FlutterI18n.translate(context, "create.attention"))
          .display(context);
      if (!result!) {
        return false;
      }
    }
    if (!state.isEdit && state.image != "") {
      FirebaseStorage.instance.refFromURL(state.image).delete();
    }
    state = state.copyWith(
        name: '',
        description: '',
        webURL: '',
        requiredIngredients: [],
        steps: [],
        attachments: [],
        glutenfrei: false,
        vegan: false,
        vegetarisch: false,
        image: "",
        nameNotSet: false,
        ingridientNotSet: false,
        stepsNotSet: false,
        descriptionNotSet: false,
        urlInvalid: false);
    return true;
  }

  @override
  Future<bool> kiImport(BuildContext context, NavigatorState navigator) async {
    bool cancelled = false;

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result == null) {
      return false;
    }

    try {
      if (!context.mounted) return false;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(FlutterI18n.translate(context, "create.ai.processing")),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SpinKitFadingCircle(
                  color: currentScheme.getScheme().primary,
                  size: 50.0,
                ),
                const SizedBox(height: 16.0),
                Text(FlutterI18n.translate(context, "create.ai.estimate")),
                Text("${FlutterI18n.translate(context, "create.ai.wait")}..."),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text(FlutterI18n.translate(context, "create.ai.cancel")),
                onPressed: () {
                  cancelled = true;
                  navigator.pop();
                },
              ),
            ],
          );
        },
      );
      String rawRecipe = await _backendService
          .rawRecipeFromImage(File(result.files.first.path!));
      Recipe recipe = await _backendService.recipeFromGPT(rawRecipe);
      ErstellenModel tmp = _backendService.recipeToErstellenModel(recipe);

      if (!cancelled) {
        state = tmp;
        navigator.pop();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      logger.e(e.toString());
      if (!cancelled) {
        navigator.pop();
      }
      return false;
    }
  }

  @override
  void helper(BuildContext context) {
    Recipe recipe = Recipe(
      id: "",
      creator: "test",
      isSubscription: false,
      privateRecipe: false,
      image: "",
      title: "Rezept von ${DateTime.now()}",
      description: "Test Beschreibung",
      guideText: ["Test Step 1", "Test Step 2"],
      ingredients: [
        Ingredient(name: "Test Zutat 1", amount: "1stck"),
        Ingredient(name: "Test Zutat 2", amount: "2stck")
      ],
      vegetarisch: false,
      vegan: false,
      glutenfrei: false,
      webURL: "Test Url",
      attachments: [],
    );
    ErstellenModel tmp = _backendService.recipeToErstellenModel(recipe);
    logger.e("Helper ErstellenModel");
    debugPrint("$tmp/n");
    state = tmp;
  }

  @override
  void navigateBack(BuildContext context) {
    _navigationService.routeHome(context);
  }
}
