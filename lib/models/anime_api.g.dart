// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeApi _$AnimeApiFromJson(Map<String, dynamic> json) => AnimeApi(
      json['rank'] as int?,
      json['title'] as String?,
      json['image_url'] as String?,
      json['type'] as String?,
      json['episodes'] as int?,
      json['start_date'] as String?,
      json['end_date'] as String?,
      (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AnimeApiToJson(AnimeApi instance) => <String, dynamic>{
      'rank': instance.rank,
      'title': instance.title,
      'image_url': instance.image_url,
      'type': instance.type,
      'episodes': instance.episodes,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'score': instance.score,
    };
