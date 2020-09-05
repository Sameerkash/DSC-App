// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

class _$EventTearOff {
  const _$EventTearOff();

// ignore: unused_element
  _Event call(
      {String eid,
      String name,
      String attendees,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) bool isRegistered = false}) {
    return _Event(
      eid: eid,
      name: name,
      attendees: attendees,
      imageUrl: imageUrl,
      description: description,
      isRegistered: isRegistered,
    );
  }
}

// ignore: unused_element
const $Event = _$EventTearOff();

mixin _$Event {
  String get eid;
  String get name;
  String get attendees;
  String get imageUrl;
  String get description;
  @JsonKey(ignore: true)
  bool get isRegistered;

  Map<String, dynamic> toJson();
  $EventCopyWith<Event> get copyWith;
}

abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {String eid,
      String name,
      String attendees,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) bool isRegistered});
}

class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object eid = freezed,
    Object name = freezed,
    Object attendees = freezed,
    Object imageUrl = freezed,
    Object description = freezed,
    Object isRegistered = freezed,
  }) {
    return _then(_value.copyWith(
      eid: eid == freezed ? _value.eid : eid as String,
      name: name == freezed ? _value.name : name as String,
      attendees: attendees == freezed ? _value.attendees : attendees as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      description:
          description == freezed ? _value.description : description as String,
      isRegistered:
          isRegistered == freezed ? _value.isRegistered : isRegistered as bool,
    ));
  }
}

abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String eid,
      String name,
      String attendees,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) bool isRegistered});
}

class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object eid = freezed,
    Object name = freezed,
    Object attendees = freezed,
    Object imageUrl = freezed,
    Object description = freezed,
    Object isRegistered = freezed,
  }) {
    return _then(_Event(
      eid: eid == freezed ? _value.eid : eid as String,
      name: name == freezed ? _value.name : name as String,
      attendees: attendees == freezed ? _value.attendees : attendees as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      description:
          description == freezed ? _value.description : description as String,
      isRegistered:
          isRegistered == freezed ? _value.isRegistered : isRegistered as bool,
    ));
  }
}

@JsonSerializable()
class _$_Event implements _Event {
  const _$_Event(
      {this.eid,
      this.name,
      this.attendees,
      this.imageUrl,
      this.description,
      @JsonKey(ignore: true) this.isRegistered = false})
      : assert(isRegistered != null);

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$_$_EventFromJson(json);

  @override
  final String eid;
  @override
  final String name;
  @override
  final String attendees;
  @override
  final String imageUrl;
  @override
  final String description;
  @override
  @JsonKey(ignore: true)
  final bool isRegistered;

  @override
  String toString() {
    return 'Event(eid: $eid, name: $name, attendees: $attendees, imageUrl: $imageUrl, description: $description, isRegistered: $isRegistered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
            (identical(other.eid, eid) ||
                const DeepCollectionEquality().equals(other.eid, eid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.attendees, attendees) ||
                const DeepCollectionEquality()
                    .equals(other.attendees, attendees)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.isRegistered, isRegistered) ||
                const DeepCollectionEquality()
                    .equals(other.isRegistered, isRegistered)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(eid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(attendees) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(isRegistered);

  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {String eid,
      String name,
      String attendees,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) bool isRegistered}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get eid;
  @override
  String get name;
  @override
  String get attendees;
  @override
  String get imageUrl;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  bool get isRegistered;
  @override
  _$EventCopyWith<_Event> get copyWith;
}
