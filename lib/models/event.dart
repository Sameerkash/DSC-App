import 'package:dsckssem/models/badge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event with _$Event {
  const factory Event({
    String eid,
    String name,
    @Default(0) int attendees,
    String imageUrl,
    String description,
    DateTime time,
    List<Badge> badges, 
    @Default("0xffffc107") String color,
    @Default("0xffffb300") String secondaryColor,
    @JsonKey(ignore: true) @Default(false) bool isRegistered,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$_$_EventToJson(this);
}
