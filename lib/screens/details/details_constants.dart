// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:plate_pal/config.dart';

//Used to have short names for the colors
// and full control over all graphic elements on details view

Color BackgroundColor = currentScheme.getScheme().background;
Color ForegroundColor = currentScheme.getScheme().surface;
Color ObjectBackgroundColor = currentScheme.getScheme().background;
Color ObjectPrimaryColor = currentScheme.getScheme().primary;
Color ObjectSecondaryColor = currentScheme.getScheme().secondary;
Color ObjectVariantColor = currentScheme.getScheme().onSurfaceVariant;
Color HighlightedTextColor = Colors.red;
Color HighlightedTextBackgroundColor = Colors.red;
const menuObjSize = 25.0;
const iconObjSize = 35.0;
get urlStyle => TextStyle(
    color: Colors.blue,
    fontStyle: FontStyle.italic,
    fontSize: currentFontSize.toDouble());

// ***************** global Widgets: *****************/

//short and clear usage of symmetrical padding when used as a Wrapping Widget
Padding symPadding(Widget child, {double? horizontal, double? vertical}) {
  return (Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? 0, vertical: vertical ?? 0),
      child: child));
}

// ***************** global Methods: *****************/

void loadColors() {
  //this method is needed as the variables don't get updated in time
  BackgroundColor = currentScheme.getScheme().background;
  ForegroundColor = currentScheme.getScheme().surface;
  ObjectBackgroundColor = currentScheme.getScheme().background;
  ObjectPrimaryColor = currentScheme.getScheme().primary;
  ObjectSecondaryColor = currentScheme.getScheme().secondary;
  ObjectVariantColor = currentScheme.getScheme().onSurfaceVariant;
}
