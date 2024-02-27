// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: json['id'] as String,
      creator: json['creator'] as String,
      isSubscription: json['isSubscription'] as bool,
      privateRecipe: json['privateRecipe'] as bool,
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      guideText: json['guideText'] as List<dynamic>,
      ingredients: json['ingredients'] as List<dynamic>,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vegetarisch: json['vegetarisch'] as bool,
      vegan: json['vegan'] as bool,
      glutenfrei: json['glutenfrei'] as bool,
      webURL: json['webURL'] as String?,
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator,
      'isSubscription': instance.isSubscription,
      'privateRecipe': instance.privateRecipe,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'guideText': instance.guideText,
      'ingredients': instance.ingredients,
      'attachments': instance.attachments,
      'vegetarisch': instance.vegetarisch,
      'vegan': instance.vegan,
      'glutenfrei': instance.glutenfrei,
      'webURL': instance.webURL,
    };

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      name: json['name'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };
