// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {String uid,
      String userName,
      String usn,
      String phone,
      String email,
      bool isAdmin = false}) {
    return _User(
      uid: uid,
      userName: userName,
      usn: usn,
      phone: phone,
      email: email,
      isAdmin: isAdmin,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  String get uid;
  String get userName;
  String get usn;
  String get phone;
  String get email;
  bool get isAdmin;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String userName,
      String usn,
      String phone,
      String email,
      bool isAdmin});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object userName = freezed,
    Object usn = freezed,
    Object phone = freezed,
    Object email = freezed,
    Object isAdmin = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
      userName: userName == freezed ? _value.userName : userName as String,
      usn: usn == freezed ? _value.usn : usn as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
      isAdmin: isAdmin == freezed ? _value.isAdmin : isAdmin as bool,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String userName,
      String usn,
      String phone,
      String email,
      bool isAdmin});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object uid = freezed,
    Object userName = freezed,
    Object usn = freezed,
    Object phone = freezed,
    Object email = freezed,
    Object isAdmin = freezed,
  }) {
    return _then(_User(
      uid: uid == freezed ? _value.uid : uid as String,
      userName: userName == freezed ? _value.userName : userName as String,
      usn: usn == freezed ? _value.usn : usn as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
      isAdmin: isAdmin == freezed ? _value.isAdmin : isAdmin as bool,
    ));
  }
}

@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.uid,
      this.userName,
      this.usn,
      this.phone,
      this.email,
      this.isAdmin = false})
      : assert(isAdmin != null);

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String uid;
  @override
  final String userName;
  @override
  final String usn;
  @override
  final String phone;
  @override
  final String email;
  @JsonKey(defaultValue: false)
  @override
  final bool isAdmin;

  @override
  String toString() {
    return 'User(uid: $uid, userName: $userName, usn: $usn, phone: $phone, email: $email, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.usn, usn) ||
                const DeepCollectionEquality().equals(other.usn, usn)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality().equals(other.isAdmin, isAdmin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(usn) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(isAdmin);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {String uid,
      String userName,
      String usn,
      String phone,
      String email,
      bool isAdmin}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get uid;
  @override
  String get userName;
  @override
  String get usn;
  @override
  String get phone;
  @override
  String get email;
  @override
  bool get isAdmin;
  @override
  _$UserCopyWith<_User> get copyWith;
}
