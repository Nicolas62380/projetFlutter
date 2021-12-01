import 'package:json_annotation/json_annotation.dart';


/// flutter packages pub run build_runner build --delete-conflicting-outputs
part 'liste_anime_api.g.dart';

@JsonSerializable()
class ListeAnimeApi {
  final int? rank;
  final String? title;
  final String? image_url;
  final String? type;
  final int? episodes;
  final DateTime? start_date;
  final DateTime? end_date;
  final double? score;

  ListeAnimeApi(this.rank, this.title, this.image_url, this.type, this.episodes, this.start_date, this.end_date, this.score);

  factory ListeAnimeApi.fromJson(Map<String, dynamic> json) => _$ListeAnimeApiFromJson(json);

  Map<String, dynamic> toJson() => _$ListeAnimeApiToJson(this);
}