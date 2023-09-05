import 'package:flutter/material.dart';
import 'package:plate_pal/screens/erstellen/erstellen_model.dart';
import 'package:plate_pal/screens/home/home_model.dart';

abstract class MyAppNavigationService {
  RouterDelegate<Object>? getRouterDelegate;
  void routeHome(BuildContext context);
  void routeCreate(BuildContext context);
  void routeEdit(BuildContext context, ErstellenModel model);
  void routeFavorites(BuildContext context);
  void routeAccount(BuildContext context);
  void routeDetails(BuildContext context, Recipe recipe);
  void routeFilter(BuildContext context, Function(List<bool>) function);
  void routeBackWithData(BuildContext context, List<bool> result);
  void routeBack(BuildContext context);
  void routeGroup(BuildContext context);
  void routeLogin(BuildContext context);
}
