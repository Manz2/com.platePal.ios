import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plate_pal/screens/home/home_backend_service.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/screens/home/home_view.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';

class HomeControllerImplmentation extends HomeController {
  final HomeBackendService _backendService;
  final MyAppNavigationService _navigationService;
  HomeControllerImplmentation({
    HomeModel? model,
    required HomeBackendService backendService,
    required MyAppNavigationService navigationService,
  })  : _backendService = backendService,
        _navigationService = navigationService,
        super(model ?? const HomeModel(recipes: [], hasFetchedOnInit: false));

  @override
  Future<void> getRecipes(String uid) async {
    HomeServiceReturn list = await _backendService.getAllRecipes(uid);
    state = state.copyWith(recipes: list.recipes, hasFetchedOnInit: true);
  }

  @override
  Future<void> search(String term) async {
    await getRecipes(FirebaseAuth.instance.currentUser!.uid);
    List<Recipe> temp = [];
    for (Recipe rec in state.recipes) {
      if (rec.title.toLowerCase().contains(term.toLowerCase()) ||
          rec.description.toLowerCase().contains(term.toLowerCase())) {
        //Add ingredients
        temp.add(rec);
      }
    }
    if (term == "" || term == " ") {
      getRecipes(FirebaseAuth.instance.currentUser!.uid);
    } else {
      state = state.copyWith(recipes: temp);
    }
  }

  @override
  void filter(BuildContext context) async {
    _navigationService.routeFilter(context, filterWith);
  }

  void filterWith(List<bool> list) async {
    HomeServiceReturn recipeList = await _backendService.filterRecipes(
        list[0], list[1], list[2], FirebaseAuth.instance.currentUser!.uid);
    state = state.copyWith(recipes: recipeList.recipes);
  }

  @override
  Future<void> reload(String uid) async {
    getRecipes(uid);
  }

  @override
  void navigateAccount(BuildContext context) {
    _navigationService.routeAccount(context);
  }

  @override
  void navigateCreate(BuildContext context) {
    _navigationService.routeCreate(context);
  }

  @override
  void navigateDetail(BuildContext context, Recipe recipe) {
    _navigationService.routeDetails(context, recipe);
  }

  @override
  void navigateFavorites(BuildContext context) {
    _navigationService.routeFavorites(context);
  }

  @override
  MyAppNavigationService getNavigationservice() {
    return _navigationService;
  }
}
