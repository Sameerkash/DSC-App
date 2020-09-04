// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    uid: json['uid'] as String,
    userName: json['userName'] as String,
    usn: json['usn'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    isAdmin: json['isAdmin'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'usn': instance.usn,
      'phone': instance.phone,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
    };
