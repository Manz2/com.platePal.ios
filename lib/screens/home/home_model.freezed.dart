// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeModel {
  List<Recipe> get recipes => throw _privateConstructorUsedError;
  bool get hasFetchedOnInit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res, HomeModel>;
  @useResult
  $Res call({List<Recipe> recipes, bool hasFetchedOnInit});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res, $Val extends HomeModel>
    implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? hasFetchedOnInit = null,
  }) {
    return _then(_value.copyWith(
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      hasFetchedOnInit: null == hasFetchedOnInit
          ? _value.hasFetchedOnInit
          : hasFetchedOnInit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$$_HomeModelCopyWith(
          _$_HomeModel value, $Res Function(_$_HomeModel) then) =
      __$$_HomeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> recipes, bool hasFetchedOnInit});
}

/// @nodoc
class __$$_HomeModelCopyWithImpl<$Res>
    extends _$HomeModelCopyWithImpl<$Res, _$_HomeModel>
    implements _$$_HomeModelCopyWith<$Res> {
  __$$_HomeModelCopyWithImpl(
      _$_HomeModel _value, $Res Function(_$_HomeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? hasFetchedOnInit = null,
  }) {
    return _then(_$_HomeModel(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      hasFetchedOnInit: null == hasFetchedOnInit
          ? _value.hasFetchedOnInit
          : hasFetchedOnInit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeModel implements _HomeModel {
  const _$_HomeModel(
      {required final List<Recipe> recipes, required this.hasFetchedOnInit})
      : _recipes = recipes;

  final List<Recipe> _recipes;
  @override
  List<Recipe> get recipes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  final bool hasFetchedOnInit;

  @override
  String toString() {
    return 'HomeModel(recipes: $recipes, hasFetchedOnInit: $hasFetchedOnInit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeModel &&
            const DeepCollectionEquality().equals(other._recipes, _recipes) &&
            (identical(other.hasFetchedOnInit, hasFetchedOnInit) ||
                other.hasFetchedOnInit == hasFetchedOnInit));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_recipes), hasFetchedOnInit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      __$$_HomeModelCopyWithImpl<_$_HomeModel>(this, _$identity);
}

abstract class _HomeModel implements HomeModel {
  const factory _HomeModel(
      {required final List<Recipe> recipes,
      required final bool hasFetchedOnInit}) = _$_HomeModel;

  @override
  List<Recipe> get recipes;
  @override
  bool get hasFetchedOnInit;
  @override
  @JsonKey(ignore: true)
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String get id => throw _privateConstructorUsedError; //no visible User-Entry
  String get creator =>
      throw _privateConstructorUsedError; //no visible User-Entry
  bool get isSubscription =>
      throw _privateConstructorUsedError; //no visible User-Entry
  bool get privateRecipe => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<dynamic> get guideText => throw _privateConstructorUsedError; //String
  List<dynamic> get ingredients =>
      throw _privateConstructorUsedError; //Map<String, dynamic>
  List<String>? get attachments => throw _privateConstructorUsedError;
  bool get vegetarisch => throw _privateConstructorUsedError;
  bool get vegan => throw _privateConstructorUsedError;
  bool get glutenfrei => throw _privateConstructorUsedError;
  String? get webURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String id,
      String creator,
      bool isSubscription,
      bool privateRecipe,
      String image,
      String title,
      String description,
      List<dynamic> guideText,
      List<dynamic> ingredients,
      List<String>? attachments,
      bool vegetarisch,
      bool vegan,
      bool glutenfrei,
      String? webURL});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creator = null,
    Object? isSubscription = null,
    Object? privateRecipe = null,
    Object? image = null,
    Object? title = null,
    Object? description = null,
    Object? guideText = null,
    Object? ingredients = null,
    Object? attachments = freezed,
    Object? vegetarisch = null,
    Object? vegan = null,
    Object? glutenfrei = null,
    Object? webURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscription: null == isSubscription
          ? _value.isSubscription
          : isSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      privateRecipe: null == privateRecipe
          ? _value.privateRecipe
          : privateRecipe // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      guideText: null == guideText
          ? _value.guideText
          : guideText // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vegetarisch: null == vegetarisch
          ? _value.vegetarisch
          : vegetarisch // ignore: cast_nullable_to_non_nullable
              as bool,
      vegan: null == vegan
          ? _value.vegan
          : vegan // ignore: cast_nullable_to_non_nullable
              as bool,
      glutenfrei: null == glutenfrei
          ? _value.glutenfrei
          : glutenfrei // ignore: cast_nullable_to_non_nullable
              as bool,
      webURL: freezed == webURL
          ? _value.webURL
          : webURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) =
      __$$_RecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String creator,
      bool isSubscription,
      bool privateRecipe,
      String image,
      String title,
      String description,
      List<dynamic> guideText,
      List<dynamic> ingredients,
      List<String>? attachments,
      bool vegetarisch,
      bool vegan,
      bool glutenfrei,
      String? webURL});
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$_Recipe>
    implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creator = null,
    Object? isSubscription = null,
    Object? privateRecipe = null,
    Object? image = null,
    Object? title = null,
    Object? description = null,
    Object? guideText = null,
    Object? ingredients = null,
    Object? attachments = freezed,
    Object? vegetarisch = null,
    Object? vegan = null,
    Object? glutenfrei = null,
    Object? webURL = freezed,
  }) {
    return _then(_$_Recipe(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscription: null == isSubscription
          ? _value.isSubscription
          : isSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      privateRecipe: null == privateRecipe
          ? _value.privateRecipe
          : privateRecipe // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      guideText: null == guideText
          ? _value._guideText
          : guideText // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vegetarisch: null == vegetarisch
          ? _value.vegetarisch
          : vegetarisch // ignore: cast_nullable_to_non_nullable
              as bool,
      vegan: null == vegan
          ? _value.vegan
          : vegan // ignore: cast_nullable_to_non_nullable
              as bool,
      glutenfrei: null == glutenfrei
          ? _value.glutenfrei
          : glutenfrei // ignore: cast_nullable_to_non_nullable
              as bool,
      webURL: freezed == webURL
          ? _value.webURL
          : webURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  const _$_Recipe(
      {required this.id,
      required this.creator,
      required this.isSubscription,
      required this.privateRecipe,
      required this.image,
      required this.title,
      required this.description,
      required final List<dynamic> guideText,
      required final List<dynamic> ingredients,
      final List<String>? attachments,
      required this.vegetarisch,
      required this.vegan,
      required this.glutenfrei,
      required this.webURL})
      : _guideText = guideText,
        _ingredients = ingredients,
        _attachments = attachments;

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  final String id;
//no visible User-Entry
  @override
  final String creator;
//no visible User-Entry
  @override
  final bool isSubscription;
//no visible User-Entry
  @override
  final bool privateRecipe;
  @override
  final String image;
  @override
  final String title;
  @override
  final String description;
  final List<dynamic> _guideText;
  @override
  List<dynamic> get guideText {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guideText);
  }

//String
  final List<dynamic> _ingredients;
//String
  @override
  List<dynamic> get ingredients {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

//Map<String, dynamic>
  final List<String>? _attachments;
//Map<String, dynamic>
  @override
  List<String>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool vegetarisch;
  @override
  final bool vegan;
  @override
  final bool glutenfrei;
  @override
  final String? webURL;

  @override
  String toString() {
    return 'Recipe(id: $id, creator: $creator, isSubscription: $isSubscription, privateRecipe: $privateRecipe, image: $image, title: $title, description: $description, guideText: $guideText, ingredients: $ingredients, attachments: $attachments, vegetarisch: $vegetarisch, vegan: $vegan, glutenfrei: $glutenfrei, webURL: $webURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.isSubscription, isSubscription) ||
                other.isSubscription == isSubscription) &&
            (identical(other.privateRecipe, privateRecipe) ||
                other.privateRecipe == privateRecipe) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._guideText, _guideText) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.vegetarisch, vegetarisch) ||
                other.vegetarisch == vegetarisch) &&
            (identical(other.vegan, vegan) || other.vegan == vegan) &&
            (identical(other.glutenfrei, glutenfrei) ||
                other.glutenfrei == glutenfrei) &&
            (identical(other.webURL, webURL) || other.webURL == webURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creator,
      isSubscription,
      privateRecipe,
      image,
      title,
      description,
      const DeepCollectionEquality().hash(_guideText),
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_attachments),
      vegetarisch,
      vegan,
      glutenfrei,
      webURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final String id,
      required final String creator,
      required final bool isSubscription,
      required final bool privateRecipe,
      required final String image,
      required final String title,
      required final String description,
      required final List<dynamic> guideText,
      required final List<dynamic> ingredients,
      final List<String>? attachments,
      required final bool vegetarisch,
      required final bool vegan,
      required final bool glutenfrei,
      required final String? webURL}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  String get id;
  @override //no visible User-Entry
  String get creator;
  @override //no visible User-Entry
  bool get isSubscription;
  @override //no visible User-Entry
  bool get privateRecipe;
  @override
  String get image;
  @override
  String get title;
  @override
  String get description;
  @override
  List<dynamic> get guideText;
  @override //String
  List<dynamic> get ingredients;
  @override //Map<String, dynamic>
  List<String>? get attachments;
  @override
  bool get vegetarisch;
  @override
  bool get vegan;
  @override
  bool get glutenfrei;
  @override
  String? get webURL;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
mixin _$Ingredient {
  String get name => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res, Ingredient>;
  @useResult
  $Res call({String name, String amount});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res, $Val extends Ingredient>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientCopyWith<$Res>
    implements $IngredientCopyWith<$Res> {
  factory _$$_IngredientCopyWith(
          _$_Ingredient value, $Res Function(_$_Ingredient) then) =
      __$$_IngredientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String amount});
}

/// @nodoc
class __$$_IngredientCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$_Ingredient>
    implements _$$_IngredientCopyWith<$Res> {
  __$$_IngredientCopyWithImpl(
      _$_Ingredient _value, $Res Function(_$_Ingredient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_$_Ingredient(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ingredient implements _Ingredient {
  _$_Ingredient({required this.name, required this.amount});

  factory _$_Ingredient.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientFromJson(json);

  @override
  final String name;
  @override
  final String amount;

  @override
  String toString() {
    return 'Ingredient(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ingredient &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientCopyWith<_$_Ingredient> get copyWith =>
      __$$_IngredientCopyWithImpl<_$_Ingredient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientToJson(
      this,
    );
  }
}

abstract class _Ingredient implements Ingredient {
  factory _Ingredient(
      {required final String name,
      required final String amount}) = _$_Ingredient;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$_Ingredient.fromJson;

  @override
  String get name;
  @override
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientCopyWith<_$_Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}
