import 'package:json_annotation/json_annotation.dart';


/// flutter packages pub run build_runner build --delete-conflicting-outputs
part 'anime_api.g.dart';

@JsonSerializable()
class AnimeApi {
  final int? rank;//faire une classe avec UNE variable tableau pour les TOP
  final String? title;
  final String? image_url;
  final String? type;
  final int? episodes;
  final DateTime? start_date;
  final DateTime? end_date;
  final double? score;

  AnimeApi(this.rank, this.title, this.image_url, this.type, this.episodes, this.start_date, this.end_date, this.score);

  factory AnimeApi.fromJson(Map<String, dynamic> json) => _$AnimeApiFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeApiToJson(this);
}