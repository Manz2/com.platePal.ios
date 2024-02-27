// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favoriten_backend_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoritenServiceReturn {
  List<Recipe> get recipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritenServiceReturnCopyWith<FavoritenServiceReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritenServiceReturnCopyWith<$Res> {
  factory $FavoritenServiceReturnCopyWith(FavoritenServiceReturn value,
          $Res Function(FavoritenServiceReturn) then) =
      _$FavoritenServiceReturnCopyWithImpl<$Res, FavoritenServiceReturn>;
  @useResult
  $Res call({List<Recipe> recipes});
}

/// @nodoc
class _$FavoritenServiceReturnCopyWithImpl<$Res,
        $Val extends FavoritenServiceReturn>
    implements $FavoritenServiceReturnCopyWith<$Res> {
  _$FavoritenServiceReturnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_value.copyWith(
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritenServiceReturnImplCopyWith<$Res>
    implements $FavoritenServiceReturnCopyWith<$Res> {
  factory _$$FavoritenServiceReturnImplCopyWith(
          _$FavoritenServiceReturnImpl value,
          $Res Function(_$FavoritenServiceReturnImpl) then) =
      __$$FavoritenServiceReturnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> recipes});
}

/// @nodoc
class __$$FavoritenServiceReturnImplCopyWithImpl<$Res>
    extends _$FavoritenServiceReturnCopyWithImpl<$Res,
        _$FavoritenServiceReturnImpl>
    implements _$$FavoritenServiceReturnImplCopyWith<$Res> {
  __$$FavoritenServiceReturnImplCopyWithImpl(
      _$FavoritenServiceReturnImpl _value,
      $Res Function(_$FavoritenServiceReturnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_$FavoritenServiceReturnImpl(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc

class _$FavoritenServiceReturnImpl implements _FavoritenServiceReturn {
  const _$FavoritenServiceReturnImpl({required final List<Recipe> recipes})
      : _recipes = recipes;

  final List<Recipe> _recipes;
  @override
  List<Recipe> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'FavoritenServiceReturn(recipes: $recipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritenServiceReturnImpl &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritenServiceReturnImplCopyWith<_$FavoritenServiceReturnImpl>
      get copyWith => __$$FavoritenServiceReturnImplCopyWithImpl<
          _$FavoritenServiceReturnImpl>(this, _$identity);
}

abstract class _FavoritenServiceReturn implements FavoritenServiceReturn {
  const factory _FavoritenServiceReturn({required final List<Recipe> recipes}) =
      _$FavoritenServiceReturnImpl;

  @override
  List<Recipe> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$FavoritenServiceReturnImplCopyWith<_$FavoritenServiceReturnImpl>
      get copyWith => throw _privateConstructorUsedError;
}
