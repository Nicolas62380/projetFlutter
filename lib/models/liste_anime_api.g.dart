// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liste_anime_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listeanimeapi _$ListeanimeapiFromJson(Map<String, dynamic> json) =>
    Listeanimeapi(
      json['rank'] as int,
      json['title'] as String,
      json['image_url'] as String,
      json['type'] as String,
      json['episodes'] as int,
      DateTime.parse(json['start_date'] as String),
      DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$ListeanimeapiToJson(Listeanimeapi instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'title': instance.title,
      'image_url': instance.image_url,
      'type': instance.type,
      'episodes': instance.episodes,
      'start_date': instance.start_date.toIso8601String(),
      'end_date': instance.end_date.toIso8601String(),
    };
