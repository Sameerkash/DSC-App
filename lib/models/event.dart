import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event with _$Event {
  const factory Event(
      {String eid,
      String name,
      String attendees,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) @Default(false) bool isRegistered}) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$_$_EventToJson(this);
}
