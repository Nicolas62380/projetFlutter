import 'package:json_annotation/json_annotation.dart';
import 'package:projetflutter/models/anime_api.dart';


/// flutter packages pub run build_runner build --delete-conflicting-outputs
part 'liste_top_api.g.dart';

@JsonSerializable()
class ListeTopApi {
 final List<AnimeApi> top;
  ListeTopApi(this.top);

  factory ListeTopApi.fromJson(Map<String, dynamic> json) => _$ListeTopApiFromJson(json);

  Map<String, dynamic> toJson() => _$ListeTopApiToJson(this);
}