import 'package:plate_pal/screens/home/home_model.dart';
import 'erstellen_model.dart';
import 'dart:io';

abstract class ErstellenBackendService {
  void pushRecipe(Recipe recipe, String uid, bool isEdit);
  Future<String> rawRecipeFromImage(File file);
  Future<Recipe> recipeFromGPT(String rezept);
  ErstellenModel recipeToErstellenModel(Recipe recipe, {bool edit = false});
}
