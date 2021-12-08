import 'package:json_annotation/json_annotation.dart';

/// flutter packages pub run build_runner build --delete-conflicting-outputs
part 'anime_api.g.dart';

@JsonSerializable()
class AnimeApi {
  final int? rank; //faire une classe avec UNE variable tableau pour les TOP
  final String? title;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  final String? type;
  final int? episodes;
  @JsonKey(name: "start_date")
  final String? startDate;
  @JsonKey(name: "end_date")
  final String? endDate;
  final double? score;

  AnimeApi(this.rank, this.title, this.imageUrl, this.type, this.episodes,
      this.startDate, this.endDate, this.score);

  factory AnimeApi.fromJson(Map<String, dynamic> json) =>
      _$AnimeApiFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeApiToJson(this);
}
