import 'package:flutter/material.dart';
import 'package:projetflutter/models/anime_api.dart';

class DetailAnime extends StatelessWidget {
  const DetailAnime({Key? key}) : super(key: key);

  static const routeName = "./detail_anime";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailAnimeArgs;
    String? imgUrl = args.anime.imageUrl;
    int? rangAnime = args.anime.rank;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.anime.title.toString(),style: const TextStyle(color:Color(0xffff8f00))),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(image: imgUrl, rang: rangAnime);
              }));
            },
            child: Hero(
              tag: 'imageHero' + rangAnime!.toString(),
              child: Image.network(
                args.anime.imageUrl!,
              ),
            ),
          ),
          //Image.network(args.anime.imageUrl!),
          Text(args.anime.title.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold,
          color: Colors.white)),
          Text("Nombres d'épisodes : " + args.anime.episodes.toString(),
          style: const TextStyle(color: Colors.white)),
          Text("Type : " + args.anime.type.toString(),
          style: const TextStyle(color: Colors.white)),
          Text("Rang : " + args.anime.rank.toString(),
          style: const TextStyle(color: Colors.white)),
          Text("Score : " + args.anime.score.toString(),
          style: const TextStyle(color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Début : " + args.anime.startDate.toString(),
              style: const TextStyle(color: Colors.white)),
              const SizedBox(
                width: 20,
              ),
              Text("Fin : " + args.anime.endDate.toString(),
              style: const TextStyle(color: Colors.white)),
            ],
          ),
        ],
      )),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.image, required this.rang})
      : super(key: key);
  final String? image;
  final int? rang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero' + rang!.toString(),
            child: Image.network(image!, scale: 0.5),
          ),
        ),
      ),
    );
  }
}

class DetailAnimeArgs {
  final AnimeApi anime;

  DetailAnimeArgs(this.anime);
}
