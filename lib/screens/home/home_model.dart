import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required List<Recipe> recipes,
    required bool hasFetchedOnInit,
  }) = _HomeModel;
}

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id, //no visible User-Entry
    required String creator, //no visible User-Entry
    required bool isSubscription, //no visible User-Entry
    required bool privateRecipe,
    required String image,
    required String title,
    required String description,
    required List<dynamic> guideText, //String
    required List<dynamic> ingredients, //Map<String, dynamic>
    List<String>? attachments,
    required bool vegetarisch,
    required bool vegan,
    required bool glutenfrei,
    required String? webURL,
  }) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    required String name,
    required String amount,
  }) = _Ingredient;
  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
