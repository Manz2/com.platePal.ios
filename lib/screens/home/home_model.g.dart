// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
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

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
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

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      name: json['name'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };
