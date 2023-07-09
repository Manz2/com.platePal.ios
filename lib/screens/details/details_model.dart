import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../home/home_model.dart';
part 'details_model.freezed.dart';

@freezed
class DetailsModel with _$DetailsModel {
  const factory DetailsModel({
    required Recipe recipe,
    required bool isFavorite,
    required List<Ingredient> ingredients,
    required List<Ingredient> scaledIngredients,
    required List<List<TextSpan>> guideTextWidgets,
    required bool isInEditMode,
    required double amountScale,
    Ingredient? currentlySearchedIngredient,
  }) = _DetailsModel;
}

Recipe emptyRecipe() {
  return const Recipe(
    id: "-1",
    title: "Recipe is loading...",
    creator: "unknown",
    privateRecipe: false,
    isSubscription: false,
    image: "",
    description: "please wait...",
    guideText: ["add Ingredient", "and add a second Ingredient"],
    ingredients: [],
    attachments: [],
    webURL: null,
    vegetarisch: false,
    vegan: false,
    glutenfrei: false,
  );
}

Map<String, dynamic> myIngredientAsJson = myIngredient().toJson();
Ingredient myIngredient() {
  return Ingredient(
    name: "Recipe is loading...",
    amount: "please wait...",
  );
}
