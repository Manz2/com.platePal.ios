// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_backend_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeServiceReturn {
  List<Recipe> get recipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeServiceReturnCopyWith<HomeServiceReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeServiceReturnCopyWith<$Res> {
  factory $HomeServiceReturnCopyWith(
          HomeServiceReturn value, $Res Function(HomeServiceReturn) then) =
      _$HomeServiceReturnCopyWithImpl<$Res, HomeServiceReturn>;
  @useResult
  $Res call({List<Recipe> recipes});
}

/// @nodoc
class _$HomeServiceReturnCopyWithImpl<$Res, $Val extends HomeServiceReturn>
    implements $HomeServiceReturnCopyWith<$Res> {
  _$HomeServiceReturnCopyWithImpl(this._value, this._then);

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
abstract class _$$HomeServiceReturnImplCopyWith<$Res>
    implements $HomeServiceReturnCopyWith<$Res> {
  factory _$$HomeServiceReturnImplCopyWith(_$HomeServiceReturnImpl value,
          $Res Function(_$HomeServiceReturnImpl) then) =
      __$$HomeServiceReturnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> recipes});
}

/// @nodoc
class __$$HomeServiceReturnImplCopyWithImpl<$Res>
    extends _$HomeServiceReturnCopyWithImpl<$Res, _$HomeServiceReturnImpl>
    implements _$$HomeServiceReturnImplCopyWith<$Res> {
  __$$HomeServiceReturnImplCopyWithImpl(_$HomeServiceReturnImpl _value,
      $Res Function(_$HomeServiceReturnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_$HomeServiceReturnImpl(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc

class _$HomeServiceReturnImpl implements _HomeServiceReturn {
  const _$HomeServiceReturnImpl({required final List<Recipe> recipes})
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
    return 'HomeServiceReturn(recipes: $recipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeServiceReturnImpl &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeServiceReturnImplCopyWith<_$HomeServiceReturnImpl> get copyWith =>
      __$$HomeServiceReturnImplCopyWithImpl<_$HomeServiceReturnImpl>(
          this, _$identity);
}

abstract class _HomeServiceReturn implements HomeServiceReturn {
  const factory _HomeServiceReturn({required final List<Recipe> recipes}) =
      _$HomeServiceReturnImpl;

  @override
  List<Recipe> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$HomeServiceReturnImplCopyWith<_$HomeServiceReturnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
