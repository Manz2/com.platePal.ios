import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plate_pal/screens/favoriten/favoriten_backend_service.dart';
import 'package:plate_pal/screens/favoriten/favorite_model.dart';
import 'package:plate_pal/screens/favoriten/favorite_view.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';

class FavoriteControllerImplmentation extends FavoriteController {
  final FavoritenBackendService _backendService;
  final MyAppNavigationService _navigationService;
  FavoriteControllerImplmentation({
    FavoriteModel? model,
    required FavoritenBackendService backendService,
    required MyAppNavigationService navigationService,
  })  : _backendService = backendService,
        _navigationService = navigationService,
        super(model ??
            const FavoriteModel(favoriten: [], hasFetchedOnInit: false));

  @override
  Future<void> getFavorites() async {
    FavoritenServiceReturn favorites = await _backendService
        .getFavorites(FirebaseAuth.instance.currentUser!.uid);
    state =
        state.copyWith(favoriten: favorites.recipes, hasFetchedOnInit: true);
  }

  @override
  Future<void> search(String term) async {
    await getFavorites();
    List<Recipe> temp = [];
    for (Recipe rec in state.favoriten) {
      if (rec.title.toLowerCase().contains(term.toLowerCase()) ||
          rec.description.toLowerCase().contains(term.toLowerCase())) {
        //Add ingredients
        temp.add(rec);
      }
    }
    if (temp.isEmpty || term == "" || term == " ") {
      getFavorites();
    } else {
      state = state.copyWith(favoriten: temp);
    }
  }

  @override
  void filter(BuildContext context) async {
    _navigationService.routeFilter(context, filterWith);
  }

  void filterWith(List<bool> list) async {
    FavoritenServiceReturn recipeList = await _backendService.filterFavorites(
      FirebaseAuth.instance.currentUser!.uid,
      list[0],
      list[1],
      list[2],
    );
    state = state.copyWith(favoriten: recipeList.recipes);
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
  void navigateHome(BuildContext context) {
    _navigationService.routeHome(context);
  }
}
