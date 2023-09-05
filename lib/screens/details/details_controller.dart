import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:logger/logger.dart';
import 'package:plate_pal/screens/details/details_model.dart';
import 'package:plate_pal/screens/details/details_view.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/service/backend_service.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import 'details_backend_service.dart';

Logger logger = Logger();

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
            const DetailsModel(
              recipe: Recipe(
                id: "",
                title: "",
                creator: "",
                privateRecipe: false,
                isSubscription: false,
                image: "",
                description: "",
                guideText: [],
                ingredients: [],
                attachments: [],
                webURL: null,
                vegetarisch: false,
                vegan: false,
                glutenfrei: false,
              ),
              checked: [],
            ));

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

  @override
  List<Ingredient> getIngredients(List list) {
    List<Ingredient> castedIngredients = [];
    for (dynamic i in list) {
      Map<String, dynamic> typed = Map<String, dynamic>.from(i);
      castedIngredients.add(Ingredient.fromJson(typed));
    }
    return castedIngredients;
  }

  @override
  void check(int index) {
    List<int> list = [];
    list.addAll(state.checked);
    if (state.checked.contains(index)) {
      list.remove(index);
    } else {
      list.add(index);
    }
    state = state.copyWith(checked: list);
  }

  @override
  void deleteRecipe(BuildContext context, Recipe recipe) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(FlutterI18n.translate(context, "details.delete_Title")),
          content: Text(FlutterI18n.translate(context, "details.delete")),
          actions: <Widget>[
            TextButton(
              child:
                  Text(FlutterI18n.translate(context, "details.CancelButton")),
              onPressed: () {
                Navigator.of(context).pop(); // Dialog schließen
              },
            ),
            TextButton(
              child: Text(FlutterI18n.translate(context, "details.ok_detete")),
              onPressed: () {
                _backendService.deleteRecipe(recipe);
                _navigationService.routeHome(context);
                final snackBar = SnackBar(
                  content:
                      Text(FlutterI18n.translate(context, "details.deleted")),
                  action: SnackBarAction(
                      label: FlutterI18n.translate(context, "details.undo"),
                      onPressed:() => {
                            BackendService().pushRecipe(recipe.copyWith(image: ""),
                                FirebaseAuth.instance.currentUser!.uid, false),
                          }),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }
}
