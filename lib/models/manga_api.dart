import 'package:json_annotation/json_annotation.dart';


/// flutter packages pub run build_runner build --delete-conflicting-outputs
part 'manga_api.g.dart';

@JsonSerializable()
class MangaApi {
  final int? rank;
  final String? title;
  final String? image_url;
  final String? type;
  final int? volumes;
  final String? start_date;
  final String? end_date;
  final double? score;

  MangaApi(this.rank, this.title, this.image_url, this.type, this.volumes, this.start_date, this.end_date, this.score);

  factory MangaApi.fromJson(Map<String, dynamic> json) => _$MangaApiFromJson(json);

  Map<String, dynamic> toJson() => _$MangaApiToJson(this);
}