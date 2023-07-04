// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterModel {
  bool get vegan => throw _privateConstructorUsedError;
  bool get vegetarisch => throw _privateConstructorUsedError;
  bool get glutenfrei => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterModelCopyWith<FilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterModelCopyWith<$Res> {
  factory $FilterModelCopyWith(
          FilterModel value, $Res Function(FilterModel) then) =
      _$FilterModelCopyWithImpl<$Res, FilterModel>;
  @useResult
  $Res call({bool vegan, bool vegetarisch, bool glutenfrei});
}

/// @nodoc
class _$FilterModelCopyWithImpl<$Res, $Val extends FilterModel>
    implements $FilterModelCopyWith<$Res> {
  _$FilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vegan = null,
    Object? vegetarisch = null,
    Object? glutenfrei = null,
  }) {
    return _then(_value.copyWith(
      vegan: null == vegan
          ? _value.vegan
          : vegan // ignore: cast_nullable_to_non_nullable
              as bool,
      vegetarisch: null == vegetarisch
          ? _value.vegetarisch
          : vegetarisch // ignore: cast_nullable_to_non_nullable
              as bool,
      glutenfrei: null == glutenfrei
          ? _value.glutenfrei
          : glutenfrei // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterModelCopyWith<$Res>
    implements $FilterModelCopyWith<$Res> {
  factory _$$_FilterModelCopyWith(
          _$_FilterModel value, $Res Function(_$_FilterModel) then) =
      __$$_FilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool vegan, bool vegetarisch, bool glutenfrei});
}

/// @nodoc
class __$$_FilterModelCopyWithImpl<$Res>
    extends _$FilterModelCopyWithImpl<$Res, _$_FilterModel>
    implements _$$_FilterModelCopyWith<$Res> {
  __$$_FilterModelCopyWithImpl(
      _$_FilterModel _value, $Res Function(_$_FilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vegan = null,
    Object? vegetarisch = null,
    Object? glutenfrei = null,
  }) {
    return _then(_$_FilterModel(
      vegan: null == vegan
          ? _value.vegan
          : vegan // ignore: cast_nullable_to_non_nullable
              as bool,
      vegetarisch: null == vegetarisch
          ? _value.vegetarisch
          : vegetarisch // ignore: cast_nullable_to_non_nullable
              as bool,
      glutenfrei: null == glutenfrei
          ? _value.glutenfrei
          : glutenfrei // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FilterModel implements _FilterModel {
  const _$_FilterModel(
      {required this.vegan,
      required this.vegetarisch,
      required this.glutenfrei});

  @override
  final bool vegan;
  @override
  final bool vegetarisch;
  @override
  final bool glutenfrei;

  @override
  String toString() {
    return 'FilterModel(vegan: $vegan, vegetarisch: $vegetarisch, glutenfrei: $glutenfrei)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterModel &&
            (identical(other.vegan, vegan) || other.vegan == vegan) &&
            (identical(other.vegetarisch, vegetarisch) ||
                other.vegetarisch == vegetarisch) &&
            (identical(other.glutenfrei, glutenfrei) ||
                other.glutenfrei == glutenfrei));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vegan, vegetarisch, glutenfrei);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterModelCopyWith<_$_FilterModel> get copyWith =>
      __$$_FilterModelCopyWithImpl<_$_FilterModel>(this, _$identity);
}

abstract class _FilterModel implements FilterModel {
  const factory _FilterModel(
      {required final bool vegan,
      required final bool vegetarisch,
      required final bool glutenfrei}) = _$_FilterModel;

  @override
  bool get vegan;
  @override
  bool get vegetarisch;
  @override
  bool get glutenfrei;
  @override
  @JsonKey(ignore: true)
  _$$_FilterModelCopyWith<_$_FilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
