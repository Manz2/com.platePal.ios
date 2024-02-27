// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailsModel {
  List<int> get checked => throw _privateConstructorUsedError;
  Recipe get recipe => throw _privateConstructorUsedError;

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
  $Res call({List<int> checked, Recipe recipe});

  $RecipeCopyWith<$Res> get recipe;
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
    Object? checked = null,
    Object? recipe = null,
  }) {
    return _then(_value.copyWith(
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as List<int>,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res> get recipe {
    return $RecipeCopyWith<$Res>(_value.recipe, (value) {
      return _then(_value.copyWith(recipe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailsModelImplCopyWith<$Res>
    implements $DetailsModelCopyWith<$Res> {
  factory _$$DetailsModelImplCopyWith(
          _$DetailsModelImpl value, $Res Function(_$DetailsModelImpl) then) =
      __$$DetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> checked, Recipe recipe});

  @override
  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class __$$DetailsModelImplCopyWithImpl<$Res>
    extends _$DetailsModelCopyWithImpl<$Res, _$DetailsModelImpl>
    implements _$$DetailsModelImplCopyWith<$Res> {
  __$$DetailsModelImplCopyWithImpl(
      _$DetailsModelImpl _value, $Res Function(_$DetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? recipe = null,
  }) {
    return _then(_$DetailsModelImpl(
      checked: null == checked
          ? _value._checked
          : checked // ignore: cast_nullable_to_non_nullable
              as List<int>,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
    ));
  }
}

/// @nodoc

class _$DetailsModelImpl implements _DetailsModel {
  const _$DetailsModelImpl(
      {required final List<int> checked, required this.recipe})
      : _checked = checked;

  final List<int> _checked;
  @override
  List<int> get checked {
    if (_checked is EqualUnmodifiableListView) return _checked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checked);
  }

  @override
  final Recipe recipe;

  @override
  String toString() {
    return 'DetailsModel(checked: $checked, recipe: $recipe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsModelImpl &&
            const DeepCollectionEquality().equals(other._checked, _checked) &&
            (identical(other.recipe, recipe) || other.recipe == recipe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_checked), recipe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsModelImplCopyWith<_$DetailsModelImpl> get copyWith =>
      __$$DetailsModelImplCopyWithImpl<_$DetailsModelImpl>(this, _$identity);
}

abstract class _DetailsModel implements DetailsModel {
  const factory _DetailsModel(
      {required final List<int> checked,
      required final Recipe recipe}) = _$DetailsModelImpl;

  @override
  List<int> get checked;
  @override
  Recipe get recipe;
  @override
  @JsonKey(ignore: true)
  _$$DetailsModelImplCopyWith<_$DetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
