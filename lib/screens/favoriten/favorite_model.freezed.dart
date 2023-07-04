// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteModel {
  List<Recipe> get favoriten => throw _privateConstructorUsedError;
  bool get hasFetchedOnInit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteModelCopyWith<FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteModelCopyWith<$Res> {
  factory $FavoriteModelCopyWith(
          FavoriteModel value, $Res Function(FavoriteModel) then) =
      _$FavoriteModelCopyWithImpl<$Res, FavoriteModel>;
  @useResult
  $Res call({List<Recipe> favoriten, bool hasFetchedOnInit});
}

/// @nodoc
class _$FavoriteModelCopyWithImpl<$Res, $Val extends FavoriteModel>
    implements $FavoriteModelCopyWith<$Res> {
  _$FavoriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriten = null,
    Object? hasFetchedOnInit = null,
  }) {
    return _then(_value.copyWith(
      favoriten: null == favoriten
          ? _value.favoriten
          : favoriten // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      hasFetchedOnInit: null == hasFetchedOnInit
          ? _value.hasFetchedOnInit
          : hasFetchedOnInit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteModelCopyWith<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  factory _$$_FavoriteModelCopyWith(
          _$_FavoriteModel value, $Res Function(_$_FavoriteModel) then) =
      __$$_FavoriteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> favoriten, bool hasFetchedOnInit});
}

/// @nodoc
class __$$_FavoriteModelCopyWithImpl<$Res>
    extends _$FavoriteModelCopyWithImpl<$Res, _$_FavoriteModel>
    implements _$$_FavoriteModelCopyWith<$Res> {
  __$$_FavoriteModelCopyWithImpl(
      _$_FavoriteModel _value, $Res Function(_$_FavoriteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriten = null,
    Object? hasFetchedOnInit = null,
  }) {
    return _then(_$_FavoriteModel(
      favoriten: null == favoriten
          ? _value._favoriten
          : favoriten // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      hasFetchedOnInit: null == hasFetchedOnInit
          ? _value.hasFetchedOnInit
          : hasFetchedOnInit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FavoriteModel implements _FavoriteModel {
  const _$_FavoriteModel(
      {required final List<Recipe> favoriten, required this.hasFetchedOnInit})
      : _favoriten = favoriten;

  final List<Recipe> _favoriten;
  @override
  List<Recipe> get favoriten {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriten);
  }

  @override
  final bool hasFetchedOnInit;

  @override
  String toString() {
    return 'FavoriteModel(favoriten: $favoriten, hasFetchedOnInit: $hasFetchedOnInit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteModel &&
            const DeepCollectionEquality()
                .equals(other._favoriten, _favoriten) &&
            (identical(other.hasFetchedOnInit, hasFetchedOnInit) ||
                other.hasFetchedOnInit == hasFetchedOnInit));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_favoriten), hasFetchedOnInit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteModelCopyWith<_$_FavoriteModel> get copyWith =>
      __$$_FavoriteModelCopyWithImpl<_$_FavoriteModel>(this, _$identity);
}

abstract class _FavoriteModel implements FavoriteModel {
  const factory _FavoriteModel(
      {required final List<Recipe> favoriten,
      required final bool hasFetchedOnInit}) = _$_FavoriteModel;

  @override
  List<Recipe> get favoriten;
  @override
  bool get hasFetchedOnInit;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteModelCopyWith<_$_FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
