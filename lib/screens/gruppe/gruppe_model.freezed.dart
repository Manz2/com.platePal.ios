// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gruppe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$GruppeModelImplCopyWith<$Res>
    implements $GruppeModelCopyWith<$Res> {
  factory _$$GruppeModelImplCopyWith(
          _$GruppeModelImpl value, $Res Function(_$GruppeModelImpl) then) =
      __$$GruppeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class __$$GruppeModelImplCopyWithImpl<$Res>
    extends _$GruppeModelCopyWithImpl<$Res, _$GruppeModelImpl>
    implements _$$GruppeModelImplCopyWith<$Res> {
  __$$GruppeModelImplCopyWithImpl(
      _$GruppeModelImpl _value, $Res Function(_$GruppeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_$GruppeModelImpl(
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ));
  }
}

/// @nodoc

class _$GruppeModelImpl implements _GruppeModel {
  const _$GruppeModelImpl({required final List<Member> members})
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
    return 'GruppeModel(members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GruppeModelImpl &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GruppeModelImplCopyWith<_$GruppeModelImpl> get copyWith =>
      __$$GruppeModelImplCopyWithImpl<_$GruppeModelImpl>(this, _$identity);
}

abstract class _GruppeModel implements GruppeModel {
  const factory _GruppeModel({required final List<Member> members}) =
      _$GruppeModelImpl;

  @override
  List<Member> get members;
  @override
  @JsonKey(ignore: true)
  _$$GruppeModelImplCopyWith<_$GruppeModelImpl> get copyWith =>
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
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, String image, int ammount});
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? image = null,
    Object? ammount = null,
  }) {
    return _then(_$MemberImpl(
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

class _$MemberImpl implements _Member {
  const _$MemberImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
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
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);
}

abstract class _Member implements Member {
  const factory _Member(
      {required final String name,
      required final String id,
      required final String image,
      required final int ammount}) = _$MemberImpl;

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
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
