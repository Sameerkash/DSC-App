// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return _Badge.fromJson(json);
}

class _$BadgeTearOff {
  const _$BadgeTearOff();

// ignore: unused_element
  _Badge call({String bid, String name, String imageUrl}) {
    return _Badge(
      bid: bid,
      name: name,
      imageUrl: imageUrl,
    );
  }
}

// ignore: unused_element
const $Badge = _$BadgeTearOff();

mixin _$Badge {
  String get bid;
  String get name;
  String get imageUrl;

  Map<String, dynamic> toJson();
  $BadgeCopyWith<Badge> get copyWith;
}

abstract class $BadgeCopyWith<$Res> {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) then) =
      _$BadgeCopyWithImpl<$Res>;
  $Res call({String bid, String name, String imageUrl});
}

class _$BadgeCopyWithImpl<$Res> implements $BadgeCopyWith<$Res> {
  _$BadgeCopyWithImpl(this._value, this._then);

  final Badge _value;
  // ignore: unused_field
  final $Res Function(Badge) _then;

  @override
  $Res call({
    Object bid = freezed,
    Object name = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      bid: bid == freezed ? _value.bid : bid as String,
      name: name == freezed ? _value.name : name as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }
}

abstract class _$BadgeCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$BadgeCopyWith(_Badge value, $Res Function(_Badge) then) =
      __$BadgeCopyWithImpl<$Res>;
  @override
  $Res call({String bid, String name, String imageUrl});
}

class __$BadgeCopyWithImpl<$Res> extends _$BadgeCopyWithImpl<$Res>
    implements _$BadgeCopyWith<$Res> {
  __$BadgeCopyWithImpl(_Badge _value, $Res Function(_Badge) _then)
      : super(_value, (v) => _then(v as _Badge));

  @override
  _Badge get _value => super._value as _Badge;

  @override
  $Res call({
    Object bid = freezed,
    Object name = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_Badge(
      bid: bid == freezed ? _value.bid : bid as String,
      name: name == freezed ? _value.name : name as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }
}

@JsonSerializable()
class _$_Badge implements _Badge {
  const _$_Badge({this.bid, this.name, this.imageUrl});

  factory _$_Badge.fromJson(Map<String, dynamic> json) =>
      _$_$_BadgeFromJson(json);

  @override
  final String bid;
  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Badge(bid: $bid, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Badge &&
            (identical(other.bid, bid) ||
                const DeepCollectionEquality().equals(other.bid, bid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl);

  @override
  _$BadgeCopyWith<_Badge> get copyWith =>
      __$BadgeCopyWithImpl<_Badge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BadgeToJson(this);
  }
}

abstract class _Badge implements Badge {
  const factory _Badge({String bid, String name, String imageUrl}) = _$_Badge;

  factory _Badge.fromJson(Map<String, dynamic> json) = _$_Badge.fromJson;

  @override
  String get bid;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  _$BadgeCopyWith<_Badge> get copyWith;
}
