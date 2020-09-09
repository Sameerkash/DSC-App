import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    String uid,
    String userName,
    String usn,
    String phone,
    String email,
    String imageUrl,
    @Default(false) bool isAdmin,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$_$_AppUserToJson(this);
}
