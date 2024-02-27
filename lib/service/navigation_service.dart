import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plate_pal/screens/account/account_view.dart';
import 'package:plate_pal/screens/details/details_view.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/erstellen/erstellen_view.dart';
import 'package:plate_pal/screens/favoriten/favorite_view.dart';
import 'package:plate_pal/screens/filter/filter_view.dart';
import 'package:plate_pal/screens/gruppe/gruppe_view.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/screens/home/home_view.dart';
import 'package:plate_pal/screens/login/login_view.dart';
import 'package:plate_pal/service/navigation_service_aggregator.dart';

class NavigationService implements NavigationServiceAggregator {
  @override
  RouterDelegate<Object>? getRouterDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => FirebaseAuth.instance.currentUser != null
            ? const HomeView()
            : const LoginView(),
        '/home': (context, state, data) => const HomeView(),
        '/group': (context, state, data) => const GruppeView(),
        '/login': (context, state, data) => const LoginView(),
        '/favorites': (context, state, data) => const FavoriteView(),
        '/edit': (context, state, data) =>
            ErstellenView(recipe: data as ErstellenModel),
        '/create': (context, state, data) => ErstellenView(),
        '/account': (context, state, data) => const AccountView(),
        '/filter': (context, state, data) =>
            FilterView(function: data as Function(List<bool>)),
        '/details': (context, state, data) =>
            DetailsView(recipe: data as Recipe),
      },
    ).call,
  );

  @override
  void routeHome(BuildContext context) {
    Beamer.of(context).beamToNamed('/home');
  }

  @override
  void routeAccount(BuildContext context) {
    Beamer.of(context).beamToNamed('/account');
  }

  @override
  void routeCreate(BuildContext context) {
    Beamer.of(context).beamToNamed('/create');
  }

  @override
  void routeEdit(BuildContext context, ErstellenModel model) {
    Beamer.of(context).beamToNamed('/edit', data: model);
  }

  @override
  void routeDetails(BuildContext context, Recipe recipe) {
    Beamer.of(context).beamToNamed('/details', data: recipe);
  }

  @override
  void routeFavorites(BuildContext context) {
    Beamer.of(context).beamToNamed('/favorites');
  }

  @override
  void routeFilter(BuildContext context, Function(List<bool>) function) {
    Beamer.of(context).beamToNamed('/filter', data: function);
  }

  @override
  void routeGroup(
    BuildContext context,
  ) {
    Beamer.of(context).beamToNamed('/group');
  }

  @override
  void routeBack(BuildContext context) {
    Beamer.of(context).beamBack();
  }

  @override
  void routeBackWithData(BuildContext context, List<bool> result) {
    Navigator.of(context).maybePop(result);
  }

  @override
  void routeLogin(BuildContext context) {
    Beamer.of(context).beamToNamed('/login');
  }
}
