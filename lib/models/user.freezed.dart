// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

class _$AppUserTearOff {
  const _$AppUserTearOff();

// ignore: unused_element
  _AppUser call(
      {String uid,
      String userName,
      String usn,
      String phone,
      String email,
      bool isAdmin = false}) {
    return _AppUser(
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
const $AppUser = _$AppUserTearOff();

mixin _$AppUser {
  String get uid;
  String get userName;
  String get usn;
  String get phone;
  String get email;
  bool get isAdmin;

  Map<String, dynamic> toJson();
  $AppUserCopyWith<AppUser> get copyWith;
}

abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String userName,
      String usn,
      String phone,
      String email,
      bool isAdmin});
}

class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  final AppUser _value;
  // ignore: unused_field
  final $Res Function(AppUser) _then;

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

abstract class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) then) =
      __$AppUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String userName,
      String usn,
      String phone,
      String email,
      bool isAdmin});
}

class __$AppUserCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(_AppUser _value, $Res Function(_AppUser) _then)
      : super(_value, (v) => _then(v as _AppUser));

  @override
  _AppUser get _value => super._value as _AppUser;

  @override
  $Res call({
    Object uid = freezed,
    Object userName = freezed,
    Object usn = freezed,
    Object phone = freezed,
    Object email = freezed,
    Object isAdmin = freezed,
  }) {
    return _then(_AppUser(
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
class _$_AppUser implements _AppUser {
  const _$_AppUser(
      {this.uid,
      this.userName,
      this.usn,
      this.phone,
      this.email,
      this.isAdmin = false})
      : assert(isAdmin != null);

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$_$_AppUserFromJson(json);

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
    return 'AppUser(uid: $uid, userName: $userName, usn: $usn, phone: $phone, email: $email, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppUser &&
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
  _$AppUserCopyWith<_AppUser> get copyWith =>
      __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppUserToJson(this);
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {String uid,
      String userName,
      String usn,
      String phone,
      String email,
      bool isAdmin}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

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
  _$AppUserCopyWith<_AppUser> get copyWith;
}
