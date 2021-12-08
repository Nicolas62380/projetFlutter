import 'package:flutter/material.dart';
import 'package:projetflutter/models/anime_api.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  static const routeName = "./detail_anime";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailAnimeArgs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail des Animes"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(args.anime2.image_url!),
          Text(args.anime2.title.toString()),
          Text(args.anime2.type.toString()),
          Text(args.anime2.rank.toString()),
          Text(args.anime2.score.toString())
        ],
      )),
    );
  }
}

class DetailAnimeArgs {
  final AnimeApi anime2;

  DetailAnimeArgs(this.anime2);
}
