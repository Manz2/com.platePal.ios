// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_backend_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountServiceReturn {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountServiceReturnCopyWith<AccountServiceReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountServiceReturnCopyWith<$Res> {
  factory $AccountServiceReturnCopyWith(AccountServiceReturn value,
          $Res Function(AccountServiceReturn) then) =
      _$AccountServiceReturnCopyWithImpl<$Res, AccountServiceReturn>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$AccountServiceReturnCopyWithImpl<$Res,
        $Val extends AccountServiceReturn>
    implements $AccountServiceReturnCopyWith<$Res> {
  _$AccountServiceReturnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountServiceReturnCopyWith<$Res>
    implements $AccountServiceReturnCopyWith<$Res> {
  factory _$$_AccountServiceReturnCopyWith(_$_AccountServiceReturn value,
          $Res Function(_$_AccountServiceReturn) then) =
      __$$_AccountServiceReturnCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_AccountServiceReturnCopyWithImpl<$Res>
    extends _$AccountServiceReturnCopyWithImpl<$Res, _$_AccountServiceReturn>
    implements _$$_AccountServiceReturnCopyWith<$Res> {
  __$$_AccountServiceReturnCopyWithImpl(_$_AccountServiceReturn _value,
      $Res Function(_$_AccountServiceReturn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_AccountServiceReturn(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccountServiceReturn implements _AccountServiceReturn {
  const _$_AccountServiceReturn({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'AccountServiceReturn(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountServiceReturn &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountServiceReturnCopyWith<_$_AccountServiceReturn> get copyWith =>
      __$$_AccountServiceReturnCopyWithImpl<_$_AccountServiceReturn>(
          this, _$identity);
}

abstract class _AccountServiceReturn implements AccountServiceReturn {
  const factory _AccountServiceReturn({required final String name}) =
      _$_AccountServiceReturn;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_AccountServiceReturnCopyWith<_$_AccountServiceReturn> get copyWith =>
      throw _privateConstructorUsedError;
}
