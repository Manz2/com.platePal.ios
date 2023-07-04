// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gruppe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GruppeModel {
  List<Member> get members => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GruppeModelCopyWith<GruppeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GruppeModelCopyWith<$Res> {
  factory $GruppeModelCopyWith(
          GruppeModel value, $Res Function(GruppeModel) then) =
      _$GruppeModelCopyWithImpl<$Res, GruppeModel>;
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class _$GruppeModelCopyWithImpl<$Res, $Val extends GruppeModel>
    implements $GruppeModelCopyWith<$Res> {
  _$GruppeModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_GruppeModelCopyWith<$Res>
    implements $GruppeModelCopyWith<$Res> {
  factory _$$_GruppeModelCopyWith(
          _$_GruppeModel value, $Res Function(_$_GruppeModel) then) =
      __$$_GruppeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class __$$_GruppeModelCopyWithImpl<$Res>
    extends _$GruppeModelCopyWithImpl<$Res, _$_GruppeModel>
    implements _$$_GruppeModelCopyWith<$Res> {
  __$$_GruppeModelCopyWithImpl(
      _$_GruppeModel _value, $Res Function(_$_GruppeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_$_GruppeModel(
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ));
  }
}

/// @nodoc

class _$_GruppeModel implements _GruppeModel {
  const _$_GruppeModel({required final List<Member> members})
      : _members = members;

  final List<Member> _members;
  @override
  List<Member> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'GruppeModel(members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GruppeModel &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GruppeModelCopyWith<_$_GruppeModel> get copyWith =>
      __$$_GruppeModelCopyWithImpl<_$_GruppeModel>(this, _$identity);
}

abstract class _GruppeModel implements GruppeModel {
  const factory _GruppeModel({required final List<Member> members}) =
      _$_GruppeModel;

  @override
  List<Member> get members;
  @override
  @JsonKey(ignore: true)
  _$$_GruppeModelCopyWith<_$_GruppeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Member {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get ammount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call({String name, String id, String image, int ammount});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? image = null,
    Object? ammount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      ammount: null == ammount
          ? _value.ammount
          : ammount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$_MemberCopyWith(_$_Member value, $Res Function(_$_Member) then) =
      __$$_MemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, String image, int ammount});
}

/// @nodoc
class __$$_MemberCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$_Member>
    implements _$$_MemberCopyWith<$Res> {
  __$$_MemberCopyWithImpl(_$_Member _value, $Res Function(_$_Member) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? image = null,
    Object? ammount = null,
  }) {
    return _then(_$_Member(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      ammount: null == ammount
          ? _value.ammount
          : ammount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Member implements _Member {
  const _$_Member(
      {required this.name,
      required this.id,
      required this.image,
      required this.ammount});

  @override
  final String name;
  @override
  final String id;
  @override
  final String image;
  @override
  final int ammount;

  @override
  String toString() {
    return 'Member(name: $name, id: $id, image: $image, ammount: $ammount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Member &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.ammount, ammount) || other.ammount == ammount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, id, image, ammount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      __$$_MemberCopyWithImpl<_$_Member>(this, _$identity);
}

abstract class _Member implements Member {
  const factory _Member(
      {required final String name,
      required final String id,
      required final String image,
      required final int ammount}) = _$_Member;

  @override
  String get name;
  @override
  String get id;
  @override
  String get image;
  @override
  int get ammount;
  @override
  @JsonKey(ignore: true)
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      throw _privateConstructorUsedError;
}
