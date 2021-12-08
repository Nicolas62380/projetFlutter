import 'package:json_annotation/json_annotation.dart';

/// flutter packages pub run build_runner build --delete-conflicting-outputs
part 'manga_api.g.dart';

@JsonSerializable()
class MangaApi {
  final int? rank;
  final String? title;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  final String? type;
  final int? volumes;
  @JsonKey(name: "start_date")
  final String? startDate;
  @JsonKey(name: "end_date")
  final String? endDate;
  final double? score;

  MangaApi(this.rank, this.title, this.imageUrl, this.type, this.volumes,
      this.startDate, this.endDate, this.score);

  factory MangaApi.fromJson(Map<String, dynamic> json) =>
      _$MangaApiFromJson(json);

  Map<String, dynamic> toJson() => _$MangaApiToJson(this);
}
