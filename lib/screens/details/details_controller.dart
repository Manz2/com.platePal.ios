import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';

import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/details/details_model.dart';
import 'package:plate_pal/screens/details/details_view.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import 'package:plate_pal/screens/details/details_constants.dart';
import '../../ui-kit/error_dialog.dart';
import 'details_backend_service.dart';

Logger logger = Logger();
String uid = "uninitialized";

class DetailsControllerImplementation extends DetailsController {
  final DetailsBackendService _backendService;
  final MyAppNavigationService _navigationService;
  DetailsControllerImplementation({
    DetailsModel? model,
    required DetailsBackendService backendService,
    required MyAppNavigationService navigationService,
  })  : _backendService = backendService,
        _navigationService = navigationService,
        super(model ??
            DetailsModel(
                recipe: emptyRecipe(),
                isFavorite: false,
                isInEditMode: false,
                ingredients: [],
                scaledIngredients: [],
                amountScale: 1,
                guideTextWidgets: []));

  @override
  Future<void> fetchRecipeDetails(String id) async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    DetailsServiceReturn returnModel = await _backendService.getRecipe(id, uid);

    List<Ingredient> castedIngredients = [];
    for (dynamic i in returnModel.recipe.ingredients) {
      Map<String, dynamic> typed = Map<String, dynamic>.from(i);
      castedIngredients.add(Ingredient.fromJson(typed));
    }
    bool isFavorite = await _backendService.isFavorite(id, uid);

    state = state.copyWith(
        recipe: returnModel.recipe,
        isFavorite: isFavorite,
        ingredients: castedIngredients,
        currentlySearchedIngredient: null, // init
        amountScale: 1, // init
        isInEditMode: false, // init
        scaledIngredients: castedIngredients // init
        );

    List<String> castedGuideTextSteps = [];
    for (String s in returnModel.recipe.guideText) {
      castedGuideTextSteps.add(s);
    }
    createIngredientReferences(castedGuideTextSteps);
  }

  void uploadRecipe(Recipe recipe) {
    _backendService.updateRecipe(recipe, uid);
  }

  void uploadMyRecipe() {
    List<Map<String, dynamic>> ingredientsAsJson =
        List<Map<String, dynamic>>.from(
            state.ingredients.map((i) => i.toJson()));
    state = state.copyWith(
        recipe: state.recipe.copyWith(ingredients: ingredientsAsJson));
    _backendService.updateRecipe(state.recipe, uid);
  }

  int attachmentSizeLimit = 5000000; //5MB
  @override
  Future<void> addAttachment(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: [
          "jpg",
          "png",
          "jpeg",
          "HEIC",
          "pdf",
          "doc",
          "docx",
          "txt"
        ],
        allowMultiple: true,
        withData: true,
        type: FileType.custom);

    if (result != null) {
      for (PlatformFile importedFile in result.files) {
        if (importedFile.size >= attachmentSizeLimit) {
          ErrorDialog(
                  message:
                      FlutterI18n.translate(context, "error.upload.message"),
                  title: FlutterI18n.translate(context, "error.upload.title"))
              .display(context);
          return;
        }
        Uint8List uploadfile = importedFile.bytes!;
        String fileName = importedFile.name;
        File output = await _localFile(fileName);
        output.writeAsBytes(uploadfile);
        if (state.recipe.attachments != null) {
          if (!state.recipe.attachments!.contains(fileName)) {
            state = state.copyWith(
                recipe: state.recipe.copyWith(
                    attachments: copyList(state.recipe.attachments!)
                      ..add(fileName))); //.. adds AND returns List
          }
        } else {
          state = state.copyWith(
              recipe: state.recipe.copyWith(attachments: [fileName]));
        }
        uploadMyRecipe();
      }
    }
  }

  List<T> copyList<T>(List<T> originalList) {
    return List<T>.from(originalList);
  }

  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<String> _returnFilePath(String fileName) async {
    final path = await _localPath;
    return (('$path/$fileName'));
  }

  Future<String> get _localPath async {
    Directory? directory;
    if (UniversalPlatform.isAndroid) {
      directory = await getExternalStorageDirectory();
      await Directory(directory!.path).create(recursive: true);
    } else if (UniversalPlatform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
      await Directory(directory.path).create(recursive: true);
    } else {
      throw UnsupportedError("Unsupported platform");
    }

    logger.d(directory.path);
    return directory.path;
  }

  @override
  Future<void> toggleFavorite() async {
    await _backendService.toggleFavorite(
        state.recipe.id, state.isFavorite, state.recipe.creator);
    state = state.copyWith(isFavorite: !state.isFavorite);
  }

  List<String> splitTextIntoSteps(String fullGuideText) {
    return fullGuideText.split("\$");
  }

  void createIngredientReferences(List<String> steps) {
    List<Ingredient> ingredients = state.ingredients;
    List<List<TextSpan>> wordWidgets = [];

    int stepIndex = 0;
    for (String step in steps) {
      // in each step
      wordWidgets.add([]);

      for (String word in step.split(" ")) {
        // within each word
        bool isIngredient = false;
        for (Ingredient ingredient in ingredients) {
          // check each ingredient
          if (word.contains(ingredient.name)) {
            if (wordWidgets[stepIndex].isNotEmpty) {
              if (wordWidgets[stepIndex].last.text == (" ")) {
                wordWidgets[stepIndex].removeLast();
              }
            }
            wordWidgets[stepIndex].add(ingredientText(word));
            isIngredient = true;
            break;
          }
        }
        if (!isIngredient) {
          wordWidgets[stepIndex].add(regularText(word));
          wordWidgets[stepIndex].add(regularText(" "));
        }
      }
      stepIndex++;
    }

    state = state.copyWith(guideTextWidgets: wordWidgets);
  }

  TextSpan regularText(String text) {
    return TextSpan(
        text: text, style: TextStyle(fontSize: currentFontSize.toDouble()));
  }

  TextSpan ingredientText(String text) {
    return TextSpan(
      text: " " + text + " ",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: currentFontSize.toDouble(),
        backgroundColor: ObjectPrimaryColor,
        color: ObjectBackgroundColor,
      ),
    );
  }

  @override
  List<bool> buildHighlightList() {
    List<bool> searchedIngredientFoundIn = [];
    for (List<TextSpan> wordsAsTextSpans in state.guideTextWidgets) {
      bool found = false;
      if (state.currentlySearchedIngredient != null) {
        for (TextSpan word in wordsAsTextSpans) {
          if (word.text!.contains(state.currentlySearchedIngredient!.name)) {
            found = true;
            break;
          }
        }
      }
      searchedIngredientFoundIn.add(found);
    }
    return searchedIngredientFoundIn;
  }

  @override
  void openAttachment(String fileName) async {
    String fullpath = await _returnFilePath(fileName);
    openFile(fullpath);
  }

  void openFile(String filePath) async {
    await OpenFile.open(filePath);
  }

  @override
  void removeFromAttachments(String fileName, context) {
    state = state.copyWith(
        recipe: state.recipe.copyWith(
            attachments: copyList(state.recipe.attachments!)
              ..remove(fileName))); //.. removes AND returns List
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
          Text(FlutterI18n.translate(context, "details.attachment_removed")),
      action: SnackBarAction(
        label: FlutterI18n.translate(context, "details.ok"),
        onPressed: () {},
      ),
    ));
    uploadMyRecipe();
  }

  @override
  void toggleIngredientHighlightingFocus(String ingredientName) {
    for (Ingredient ingredient in state.ingredients) {
      if (ingredient.name == ingredientName) {
        if (state.currentlySearchedIngredient == ingredient) {
          state = state.copyWith(currentlySearchedIngredient: null);
        } else {
          state = state.copyWith(currentlySearchedIngredient: ingredient);
        }
        return;
      }
    }
  }

  @override
  Future<void> toggleEditMode(context) async {
    if (recipeIsNotMine()) {
      bool proceed = await askWhetherToCreateLocalCopy(context);
      if (!proceed) return;
    }
    state = state.copyWith(isInEditMode: !state.isInEditMode);
    if (!state.isInEditMode) {
      // user just left the edit mode:
      uploadMyRecipe();
      scaleIngredientState();
    }
  }

  Future<bool> askWhetherToCreateLocalCopy(context) async {
    bool? result = await showConfirmationDialog(context);
    if (result == true) {
      takeOwnershipOfRecipe();
    }
    result ??= false;
    return (result);
  }

  Future<bool?> showConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(FlutterI18n.translate(
              context, "details.isSubcription_modalTitle")),
          content: Text(FlutterI18n.translate(
              context, "details.isSubcription_modalText")),
          actions: <Widget>[
            TextButton(
              child: Text(FlutterI18n.translate(
                  context, "details.isSubcription_modalCancelButton")),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(FlutterI18n.translate(
                  context, "details.isSubcription_modalConfirmButton")),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  bool recipeIsNotMine() {
    return state.recipe.creator != uid;
  }

  void takeOwnershipOfRecipe() {
    state = state.copyWith(
        recipe: state.recipe.copyWith(creator: uid, isSubscription: false));
  }

  @override
  void ingredientAmountChanged(String ingredientName, String newAmount) {
    for (Ingredient ingredient in state.scaledIngredients) {
      if (ingredient.name == ingredientName.replaceAll(" ", "")) {
        int indexOfIngredient = state.scaledIngredients.indexOf(ingredient);
        List<Ingredient> updatedIngredients = copyList(state.ingredients);
        updatedIngredients[indexOfIngredient] = state
            .ingredients[indexOfIngredient]
            .copyWith(amount: newAmount.replaceAll(RegExp(r'^\s+'), ""));
        state = state.copyWith(ingredients: updatedIngredients);
        return;
      }
    }
  }

  @override
  void ingredientNameChanged(String ingredientName, String newName) {
    for (Ingredient ingredient in state.ingredients) {
      if (ingredient.name == ingredientName.replaceAll(" ", "")) {
        int indexOfIngredient = state.ingredients.indexOf(ingredient);
        List<Ingredient> updatedIngredients = copyList(state.ingredients);
        updatedIngredients[indexOfIngredient] = state
            .ingredients[indexOfIngredient]
            .copyWith(name: newName.replaceAll(RegExp(r'^\s+'), ""));
        state = state.copyWith(ingredients: updatedIngredients);
        return;
      }
    }
  }

  @override
  void addPersonAmount() {
    if (state.amountScale >= 1) {
      state = state.copyWith(amountScale: state.amountScale + 1);
    } else {
      double currentScale = state.amountScale;
      switch (currentScale) {
        case 0.5:
          currentScale = 1;
          break;
        case 0.25:
          currentScale = 0.5;
      }
      state = state.copyWith(amountScale: currentScale);
    }
    scaleIngredientState();
  }

  @override
  void removePersonAmount() {
    if (state.amountScale > 1) {
      state = state.copyWith(amountScale: state.amountScale - 1);
    } else {
      double currentScale = state.amountScale;
      switch (currentScale) {
        case 1:
          currentScale = 0.5;
          break;
        case 0.5:
          currentScale = 0.25;
      }
      state = state.copyWith(amountScale: currentScale);
    }
    scaleIngredientState();
  }

  void scaleIngredientState() {
    List<Ingredient> scaledIngredients = [];
    for (Ingredient ingredient in state.ingredients) {
      scaledIngredients.add(ingredient.copyWith(
          amount: convertAndScale(ingredient.amount, state.amountScale)
              .toString()));
    }
    state = state.copyWith(scaledIngredients: scaledIngredients);
  }

  String convertAndScale(String input, double scalingFactor) {
    StringBuffer resultBuffer = StringBuffer();
    StringBuffer currentNumber = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      if (RegExp(r'[0-9]').hasMatch(char)) {
        currentNumber.write(char);
      } else {
        if (currentNumber.isNotEmpty) {
          double number = double.parse(currentNumber.toString());
          double scaledNumber = number * scalingFactor;
          if (scaledNumber % 1 == 0) {
            //als int darstellbar
            resultBuffer.write(scaledNumber.toInt());
          } else {
            resultBuffer.write(scaledNumber);
          }
          currentNumber.clear();
        }
        resultBuffer.write(char);
      }
    }

    if (currentNumber.isNotEmpty) {
      double number = double.parse(currentNumber.toString());
      double scaledNumber = number * scalingFactor;
      if (scaledNumber % 1 == 0) {
        resultBuffer.write(scaledNumber.toInt());
      } else {
        resultBuffer.write(scaledNumber);
      }
    }

    return resultBuffer.toString();
  }

  @override
  void renameRecipe(String newName) {
    state = state.copyWith(recipe: state.recipe.copyWith(title: newName));
  }

  @override
  void moveIngredient(int oldIndex, int newIndex) {
    List<Ingredient> updatedIngredients = copyList(state.ingredients);
    Ingredient ingredientToMove = updatedIngredients[oldIndex];
    updatedIngredients.removeAt(oldIndex);
    if (newIndex > oldIndex) {
      newIndex--; //because we removed the item before
    }
    updatedIngredients.insert(newIndex, ingredientToMove);
    state = state.copyWith(
        ingredients: updatedIngredients, scaledIngredients: updatedIngredients);
  }

  @override
  void navigateCreate(BuildContext context, ErstellenModel model) {
    _navigationService.routeEdit(context, model);
  }

  @override
  ErstellenModel recipeToErstellenModel(Recipe recipe) {
    return _backendService.recipeToErstellenModel(recipe, edit: true);
  }

  @override
  void navigateBack(BuildContext context) {
    _navigationService.routeBack(context);
  }
}
