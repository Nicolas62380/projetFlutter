// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liste_top_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListeTopApi _$ListeTopApiFromJson(Map<String, dynamic> json) => ListeTopApi(
      (json['top'] as List<dynamic>)
          .map((e) => AnimeApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListeTopApiToJson(ListeTopApi instance) =>
    <String, dynamic>{
      'top': instance.top,
    };
