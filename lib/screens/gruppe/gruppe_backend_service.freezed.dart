// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gruppe_backend_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GruppeServiceReturn {
  List<Member> get members => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GruppeServiceReturnCopyWith<GruppeServiceReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GruppeServiceReturnCopyWith<$Res> {
  factory $GruppeServiceReturnCopyWith(
          GruppeServiceReturn value, $Res Function(GruppeServiceReturn) then) =
      _$GruppeServiceReturnCopyWithImpl<$Res, GruppeServiceReturn>;
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class _$GruppeServiceReturnCopyWithImpl<$Res, $Val extends GruppeServiceReturn>
    implements $GruppeServiceReturnCopyWith<$Res> {
  _$GruppeServiceReturnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GruppeServiceReturnCopyWith<$Res>
    implements $GruppeServiceReturnCopyWith<$Res> {
  factory _$$_GruppeServiceReturnCopyWith(_$_GruppeServiceReturn value,
          $Res Function(_$_GruppeServiceReturn) then) =
      __$$_GruppeServiceReturnCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class __$$_GruppeServiceReturnCopyWithImpl<$Res>
    extends _$GruppeServiceReturnCopyWithImpl<$Res, _$_GruppeServiceReturn>
    implements _$$_GruppeServiceReturnCopyWith<$Res> {
  __$$_GruppeServiceReturnCopyWithImpl(_$_GruppeServiceReturn _value,
      $Res Function(_$_GruppeServiceReturn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_$_GruppeServiceReturn(
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ));
  }
}

/// @nodoc

class _$_GruppeServiceReturn implements _GruppeServiceReturn {
  const _$_GruppeServiceReturn({required final List<Member> members})
      : _members = members;

  final List<Member> _members;
  @override
  List<Member> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'GruppeServiceReturn(members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GruppeServiceReturn &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GruppeServiceReturnCopyWith<_$_GruppeServiceReturn> get copyWith =>
      __$$_GruppeServiceReturnCopyWithImpl<_$_GruppeServiceReturn>(
          this, _$identity);
}

abstract class _GruppeServiceReturn implements GruppeServiceReturn {
  const factory _GruppeServiceReturn({required final List<Member> members}) =
      _$_GruppeServiceReturn;

  @override
  List<Member> get members;
  @override
  @JsonKey(ignore: true)
  _$$_GruppeServiceReturnCopyWith<_$_GruppeServiceReturn> get copyWith =>
      throw _privateConstructorUsedError;
}
