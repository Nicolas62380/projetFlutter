import 'package:flutter/material.dart';
import 'package:projetflutter/models/manga_api.dart';

class DetailManga extends StatelessWidget {
  const DetailManga({Key? key}) : super(key: key);

  static const routeName = "./detail_manga";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailMangaArgs;
    String? imgUrl = args.manga.imageUrl;
    int? rangManga = args.manga.rank;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.manga.title.toString(),
        style: const TextStyle(color: Color(0xFFff8f00))),
        centerTitle: true,
        backgroundColor: const Color(0xff212226)
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(image: imgUrl, rang: rangManga);
              }));
            },
            child: Hero(
              tag: 'imageHero' + rangManga!.toString(),
              child: Image.network(
                args.manga.imageUrl!,
              ),
            ),
          ),
          //Image.network(args.manga.imageUrl!),
          Text(args.manga.title.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold,
          color: Colors.white)),
          Text("Nombre de volumes : " + args.manga.volumes.toString(),
          style: const TextStyle(color: Colors.white)),
          Text("Type : " + args.manga.type.toString(),
          style: const TextStyle(color: Colors.white)),
          Text("Rang : " + args.manga.rank.toString(),
          style: const TextStyle(color: Colors.white)),
          Text("Score : " + args.manga.score.toString(),
          style: const TextStyle(color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Début : " + args.manga.startDate.toString(),
              style: const TextStyle(color: Colors.white)),
              const SizedBox(
                width: 20,
              ),
              Text("Fin : " + args.manga.endDate.toString(),
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

class DetailMangaArgs {
  final MangaApi manga;

  DetailMangaArgs(this.manga);
}
