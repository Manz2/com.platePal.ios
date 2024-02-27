// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_backend_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailsServiceReturn {
  Recipe get recipe => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsServiceReturnCopyWith<DetailsServiceReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsServiceReturnCopyWith<$Res> {
  factory $DetailsServiceReturnCopyWith(DetailsServiceReturn value,
          $Res Function(DetailsServiceReturn) then) =
      _$DetailsServiceReturnCopyWithImpl<$Res, DetailsServiceReturn>;
  @useResult
  $Res call({Recipe recipe});

  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class _$DetailsServiceReturnCopyWithImpl<$Res,
        $Val extends DetailsServiceReturn>
    implements $DetailsServiceReturnCopyWith<$Res> {
  _$DetailsServiceReturnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$DetailsServiceReturnImplCopyWith<$Res>
    implements $DetailsServiceReturnCopyWith<$Res> {
  factory _$$DetailsServiceReturnImplCopyWith(_$DetailsServiceReturnImpl value,
          $Res Function(_$DetailsServiceReturnImpl) then) =
      __$$DetailsServiceReturnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Recipe recipe});

  @override
  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class __$$DetailsServiceReturnImplCopyWithImpl<$Res>
    extends _$DetailsServiceReturnCopyWithImpl<$Res, _$DetailsServiceReturnImpl>
    implements _$$DetailsServiceReturnImplCopyWith<$Res> {
  __$$DetailsServiceReturnImplCopyWithImpl(_$DetailsServiceReturnImpl _value,
      $Res Function(_$DetailsServiceReturnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
  }) {
    return _then(_$DetailsServiceReturnImpl(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
    ));
  }
}

/// @nodoc

class _$DetailsServiceReturnImpl implements _DetailsServiceReturn {
  const _$DetailsServiceReturnImpl({required this.recipe});

  @override
  final Recipe recipe;

  @override
  String toString() {
    return 'DetailsServiceReturn(recipe: $recipe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsServiceReturnImpl &&
            (identical(other.recipe, recipe) || other.recipe == recipe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsServiceReturnImplCopyWith<_$DetailsServiceReturnImpl>
      get copyWith =>
          __$$DetailsServiceReturnImplCopyWithImpl<_$DetailsServiceReturnImpl>(
              this, _$identity);
}

abstract class _DetailsServiceReturn implements DetailsServiceReturn {
  const factory _DetailsServiceReturn({required final Recipe recipe}) =
      _$DetailsServiceReturnImpl;

  @override
  Recipe get recipe;
  @override
  @JsonKey(ignore: true)
  _$$DetailsServiceReturnImplCopyWith<_$DetailsServiceReturnImpl>
      get copyWith => throw _privateConstructorUsedError;
}
