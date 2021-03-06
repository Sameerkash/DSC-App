// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    eid: json['eid'] as String,
    name: json['name'] as String,
    attendees: json['attendees'] as int ?? 0,
    imageUrl: json['imageUrl'] as String,
    description: json['description'] as String,
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    badges: (json['badges'] as List)
        ?.map(
            (e) => e == null ? null : Badge.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    color: json['color'] as String ?? '0xffffc107',
    secondaryColor: json['secondaryColor'] as String ?? '0xffffb300',
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) => <String, dynamic>{
      'eid': instance.eid,
      'name': instance.name,
      'attendees': instance.attendees,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'time': instance.time?.toIso8601String(),
      'badges': instance.badges,
      'color': instance.color,
      'secondaryColor': instance.secondaryColor,
    };
