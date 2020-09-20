import 'package:freezed_annotation/freezed_annotation.dart';
part 'badge.freezed.dart';
part 'badge.g.dart';

@freezed
abstract class Badge with _$Badge {
  const factory Badge({
    String bid,
    String name,
    String imageUrl,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);

  Map<String, dynamic> toJson() => _$_$_BadgeToJson(this);
}
