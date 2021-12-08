import 'package:flutter/material.dart';
import 'package:projetflutter/models/anime_api.dart';

class DetailAnime extends StatelessWidget {
  const DetailAnime({Key? key}) : super(key: key);

  static const routeName = "./detail_anime";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailAnimeArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.anime.title.toString()),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(args.anime.image_url!),
          Text("Titre de l'anime : " + args.anime.title.toString()),
          Text("Type de l'anime : " + args.anime.type.toString()),
          Text("Rang de l'anime : " + args.anime.rank.toString()),
          Text("Score de l'anime : " + args.anime.score.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Début : " + args.anime.start_date.toString()),
              const SizedBox(
                width: 20,
              ),
              Text("Fin : " + args.anime.end_date.toString()),
            ],
          ),
        ],
      )),
    );
  }
}

class DetailAnimeArgs {
  final AnimeApi anime;

  DetailAnimeArgs(this.anime);
}
