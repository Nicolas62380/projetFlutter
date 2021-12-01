// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaApi _$MangaApiFromJson(Map<String, dynamic> json) => MangaApi(
      json['rank'] as int?,
      json['title'] as String?,
      json['image_url'] as String?,
      json['type'] as String?,
      json['volumes'] as int?,
      json['start_date'] as String?,
      json['end_date'] as String?,
      (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MangaApiToJson(MangaApi instance) => <String, dynamic>{
      'rank': instance.rank,
      'title': instance.title,
      'image_url': instance.image_url,
      'type': instance.type,
      'volumes': instance.volumes,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'score': instance.score,
    };
