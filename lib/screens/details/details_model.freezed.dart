// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsModel {
  Recipe get recipe => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  List<Ingredient> get scaledIngredients => throw _privateConstructorUsedError;
  List<List<TextSpan>> get guideTextWidgets =>
      throw _privateConstructorUsedError;
  bool get isInEditMode => throw _privateConstructorUsedError;
  double get amountScale => throw _privateConstructorUsedError;
  Ingredient? get currentlySearchedIngredient =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsModelCopyWith<DetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsModelCopyWith<$Res> {
  factory $DetailsModelCopyWith(
          DetailsModel value, $Res Function(DetailsModel) then) =
      _$DetailsModelCopyWithImpl<$Res, DetailsModel>;
  @useResult
  $Res call(
      {Recipe recipe,
      bool isFavorite,
      List<Ingredient> ingredients,
      List<Ingredient> scaledIngredients,
      List<List<TextSpan>> guideTextWidgets,
      bool isInEditMode,
      double amountScale,
      Ingredient? currentlySearchedIngredient});

  $RecipeCopyWith<$Res> get recipe;
  $IngredientCopyWith<$Res>? get currentlySearchedIngredient;
}

/// @nodoc
class _$DetailsModelCopyWithImpl<$Res, $Val extends DetailsModel>
    implements $DetailsModelCopyWith<$Res> {
  _$DetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? isFavorite = null,
    Object? ingredients = null,
    Object? scaledIngredients = null,
    Object? guideTextWidgets = null,
    Object? isInEditMode = null,
    Object? amountScale = null,
    Object? currentlySearchedIngredient = freezed,
  }) {
    return _then(_value.copyWith(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      scaledIngredients: null == scaledIngredients
          ? _value.scaledIngredients
          : scaledIngredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      guideTextWidgets: null == guideTextWidgets
          ? _value.guideTextWidgets
          : guideTextWidgets // ignore: cast_nullable_to_non_nullable
              as List<List<TextSpan>>,
      isInEditMode: null == isInEditMode
          ? _value.isInEditMode
          : isInEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      amountScale: null == amountScale
          ? _value.amountScale
          : amountScale // ignore: cast_nullable_to_non_nullable
              as double,
      currentlySearchedIngredient: freezed == currentlySearchedIngredient
          ? _value.currentlySearchedIngredient
          : currentlySearchedIngredient // ignore: cast_nullable_to_non_nullable
              as Ingredient?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res> get recipe {
    return $RecipeCopyWith<$Res>(_value.recipe, (value) {
      return _then(_value.copyWith(recipe: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IngredientCopyWith<$Res>? get currentlySearchedIngredient {
    if (_value.currentlySearchedIngredient == null) {
      return null;
    }

    return $IngredientCopyWith<$Res>(_value.currentlySearchedIngredient!,
        (value) {
      return _then(_value.copyWith(currentlySearchedIngredient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailsModelCopyWith<$Res>
    implements $DetailsModelCopyWith<$Res> {
  factory _$$_DetailsModelCopyWith(
          _$_DetailsModel value, $Res Function(_$_DetailsModel) then) =
      __$$_DetailsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Recipe recipe,
      bool isFavorite,
      List<Ingredient> ingredients,
      List<Ingredient> scaledIngredients,
      List<List<TextSpan>> guideTextWidgets,
      bool isInEditMode,
      double amountScale,
      Ingredient? currentlySearchedIngredient});

  @override
  $RecipeCopyWith<$Res> get recipe;
  @override
  $IngredientCopyWith<$Res>? get currentlySearchedIngredient;
}

/// @nodoc
class __$$_DetailsModelCopyWithImpl<$Res>
    extends _$DetailsModelCopyWithImpl<$Res, _$_DetailsModel>
    implements _$$_DetailsModelCopyWith<$Res> {
  __$$_DetailsModelCopyWithImpl(
      _$_DetailsModel _value, $Res Function(_$_DetailsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? isFavorite = null,
    Object? ingredients = null,
    Object? scaledIngredients = null,
    Object? guideTextWidgets = null,
    Object? isInEditMode = null,
    Object? amountScale = null,
    Object? currentlySearchedIngredient = freezed,
  }) {
    return _then(_$_DetailsModel(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      scaledIngredients: null == scaledIngredients
          ? _value._scaledIngredients
          : scaledIngredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      guideTextWidgets: null == guideTextWidgets
          ? _value._guideTextWidgets
          : guideTextWidgets // ignore: cast_nullable_to_non_nullable
              as List<List<TextSpan>>,
      isInEditMode: null == isInEditMode
          ? _value.isInEditMode
          : isInEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      amountScale: null == amountScale
          ? _value.amountScale
          : amountScale // ignore: cast_nullable_to_non_nullable
              as double,
      currentlySearchedIngredient: freezed == currentlySearchedIngredient
          ? _value.currentlySearchedIngredient
          : currentlySearchedIngredient // ignore: cast_nullable_to_non_nullable
              as Ingredient?,
    ));
  }
}

/// @nodoc

class _$_DetailsModel implements _DetailsModel {
  const _$_DetailsModel(
      {required this.recipe,
      required this.isFavorite,
      required final List<Ingredient> ingredients,
      required final List<Ingredient> scaledIngredients,
      required final List<List<TextSpan>> guideTextWidgets,
      required this.isInEditMode,
      required this.amountScale,
      this.currentlySearchedIngredient})
      : _ingredients = ingredients,
        _scaledIngredients = scaledIngredients,
        _guideTextWidgets = guideTextWidgets;

  @override
  final Recipe recipe;
  @override
  final bool isFavorite;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<Ingredient> _scaledIngredients;
  @override
  List<Ingredient> get scaledIngredients {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scaledIngredients);
  }

  final List<List<TextSpan>> _guideTextWidgets;
  @override
  List<List<TextSpan>> get guideTextWidgets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guideTextWidgets);
  }

  @override
  final bool isInEditMode;
  @override
  final double amountScale;
  @override
  final Ingredient? currentlySearchedIngredient;

  @override
  String toString() {
    return 'DetailsModel(recipe: $recipe, isFavorite: $isFavorite, ingredients: $ingredients, scaledIngredients: $scaledIngredients, guideTextWidgets: $guideTextWidgets, isInEditMode: $isInEditMode, amountScale: $amountScale, currentlySearchedIngredient: $currentlySearchedIngredient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsModel &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality()
                .equals(other._scaledIngredients, _scaledIngredients) &&
            const DeepCollectionEquality()
                .equals(other._guideTextWidgets, _guideTextWidgets) &&
            (identical(other.isInEditMode, isInEditMode) ||
                other.isInEditMode == isInEditMode) &&
            (identical(other.amountScale, amountScale) ||
                other.amountScale == amountScale) &&
            (identical(other.currentlySearchedIngredient,
                    currentlySearchedIngredient) ||
                other.currentlySearchedIngredient ==
                    currentlySearchedIngredient));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      recipe,
      isFavorite,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_scaledIngredients),
      const DeepCollectionEquality().hash(_guideTextWidgets),
      isInEditMode,
      amountScale,
      currentlySearchedIngredient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsModelCopyWith<_$_DetailsModel> get copyWith =>
      __$$_DetailsModelCopyWithImpl<_$_DetailsModel>(this, _$identity);
}

abstract class _DetailsModel implements DetailsModel {
  const factory _DetailsModel(
      {required final Recipe recipe,
      required final bool isFavorite,
      required final List<Ingredient> ingredients,
      required final List<Ingredient> scaledIngredients,
      required final List<List<TextSpan>> guideTextWidgets,
      required final bool isInEditMode,
      required final double amountScale,
      final Ingredient? currentlySearchedIngredient}) = _$_DetailsModel;

  @override
  Recipe get recipe;
  @override
  bool get isFavorite;
  @override
  List<Ingredient> get ingredients;
  @override
  List<Ingredient> get scaledIngredients;
  @override
  List<List<TextSpan>> get guideTextWidgets;
  @override
  bool get isInEditMode;
  @override
  double get amountScale;
  @override
  Ingredient? get currentlySearchedIngredient;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsModelCopyWith<_$_DetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
