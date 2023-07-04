import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/erstellen/erstellen_backend_service.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/erstellen/erstellen_view.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import 'package:plate_pal/ui-kit/error_dialog.dart';
import 'package:plate_pal/ui-kit/error_dialog_choice.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
            ErstellenModel(
                id: '',
                name: '',
                description: '',
                webURL: '',
                requiredIngredients: [],
                steps: [],
                glutenfrei: false,
                vegan: false,
                vegetarisch: false,
                fileType: "",
                image: Future.value(Uint8List(0)),
                nameNotSet: false,
                ingridientNotSet: false,
                stepsNotSet: false,
                isValidUrl: false,
                descriptionNotSet: false,
                weburlNotSet: false,
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
    logger.e("add " + state.steps.toString());
  }

  @override
  void deleteStep(String step) {
    List<String> tmp = List<String>.from(state.steps);
    tmp.remove(step);
    state = state.copyWith(steps: tmp);
    logger.e("delete " + state.steps.toString());
  }

  @override
  void insertStep(int index, String step) {
    List<String> tmp = List<String>.from(state.steps);
    tmp.insert(index, step);
    state = state.copyWith(steps: tmp);
    logger.e("insert " + state.steps.toString());
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
    if (state.webURL == "") {
      state = state.copyWith(weburlNotSet: true);
    } else {
      state = state.copyWith(weburlNotSet: false);
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
      final snackBar = SnackBar(
        content: Text(FlutterI18n.translate(context, "create.noValidUrl")),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return oneNotSet = false;
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
        image:
            "https://firebasestorage.googleapis.com/v0/b/platepal-60ea4.appspot.com/o/images%2Fplaceholder.png?alt=media&token=80f4ccf4-1b8e-48a1-b5dd-4eeec66359cf",
        title: state.name,
        description: state.description,
        guideText: state.steps,
        ingredients: zutaten,
        vegetarisch: state.vegetarisch,
        vegan: state.vegan,
        glutenfrei: state.vegan,
        attachments: [],
        webURL: (state.webURL == "") ? null : state.webURL);
    _backendService.pushRecipe(
        recipe, uid, state.fileType, state.image, state.isEdit);

    return true;
  }

  @override
  Future<void> addImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["jpg", "png", "jpeg", "HEIC"],
        allowMultiple: false,
        withData: true,
        type: FileType.custom);

    if (result != null) {
      if (result.files.single.size >= 5000000) {
        ErrorDialog(
                message: FlutterI18n.translate(context, "error.upload.message"),
                title: FlutterI18n.translate(context, "error.upload.title"))
            .display(context);
        return;
      }
      state = state.copyWith(image: Future.value(result.files.single.bytes!));
      state = state.copyWith(fileType: result.files.single.extension!);
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
        state.fileType != "") {
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
    state = state.copyWith(
        name: '',
        description: '',
        webURL: '',
        requiredIngredients: [],
        steps: [],
        glutenfrei: false,
        vegan: false,
        vegetarisch: false,
        fileType: "",
        image: Future.value(Uint8List(0)),
        nameNotSet: false,
        ingridientNotSet: false,
        stepsNotSet: false,
        descriptionNotSet: false,
        weburlNotSet: false);
    return true;
  }

  @override
  Future<bool> kiImport(BuildContext context) async {
    bool cancelled = false;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["jpg", "png", "jpeg", "HEIC"],
        allowMultiple: false,
        type: FileType.any);
    if (result == null) {
      return false;
    }

    try {
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
                Text(FlutterI18n.translate(context, "create.ai.wait") + "..."),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text(FlutterI18n.translate(context, "create.ai.cancel")),
                onPressed: () {
                  cancelled = true;
                  logger.e("abbruch button");
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );

      logger.e("try");
      String rawRecipe = await _backendService
          .rawRecipeFromImage(File(result.files.first.path!));
      Recipe recipe = await _backendService.recipeFromGPT(rawRecipe);
      ErstellenModel tmp = _backendService.recipeToErstellenModel(recipe);
      logger.e("KI-Import ErstellenModel:");
      debugPrint(tmp.toString());

      if (!cancelled) {
        logger.e("Complete normaly");
        state = tmp;
        Navigator.of(context, rootNavigator: true).pop();
        return true;
      } else {
        logger.e("Cancelled");
        return false;
      }
    } catch (e) {
      logger.e(e.toString());
      if (!cancelled) {
        Navigator.of(context, rootNavigator: true).pop();
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
      image:
          "https://firebasestorage.googleapis.com/v0/b/platepal-60ea4.appspot.com/o/images%2Fplaceholder.png?alt=media&token=80f4ccf4-1b8e-48a1-b5dd-4eeec66359cf",
      title: "Rezept von " + DateTime.now().toString(),
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
    debugPrint(tmp.toString() + "/n");
    state = tmp;
  }

  @override
  void navigateBack(BuildContext context) {
    _navigationService.routeBack(context);
  }
}
