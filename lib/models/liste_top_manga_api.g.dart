// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liste_top_manga_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListeTopMangaApi _$ListeTopMangaApiFromJson(Map<String, dynamic> json) =>
    ListeTopMangaApi(
      (json['top'] as List<dynamic>)
          .map((e) => MangaApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListeTopMangaApiToJson(ListeTopMangaApi instance) =>
    <String, dynamic>{
      'top': instance.top,
    };
