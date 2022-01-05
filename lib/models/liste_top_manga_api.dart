import 'package:json_annotation/json_annotation.dart';
import 'package:projetflutter/models/manga_api.dart';

/// flutter packages pub run build_runner build --delete-conflicting-outputs
part 'liste_top_manga_api.g.dart';

@JsonSerializable()
class ListeTopMangaApi {
  final List<MangaApi> top;
  ListeTopMangaApi(this.top);

  factory ListeTopMangaApi.fromJson(Map<String, dynamic> json) =>
      _$ListeTopMangaApiFromJson(json);

  Map<String, dynamic> toJson() => _$ListeTopMangaApiToJson(this);
}
