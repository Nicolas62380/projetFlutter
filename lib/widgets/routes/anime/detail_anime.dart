import 'package:flutter/material.dart';
import 'package:projetflutter/models/anime_api.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key, required this.anime}) : super(key: key);
  static const routeName = "./detail_anime";
  final AnimeApi anime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail des Animes"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(anime.image_url!),
          Text(anime.title.toString()),
          Text(anime.type.toString()),
          Text(anime.rank.toString()),
          Text(anime.score.toString())
        ],
      )),
    );
  }
}

class DetailAnimeArgs {
  final AnimeApi anime2;

  DetailAnimeArgs(this.anime2);
}
