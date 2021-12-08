import 'package:flutter/material.dart';
import 'package:projetflutter/models/manga_api.dart';

class DetailManga extends StatelessWidget {
  const DetailManga({Key? key}) : super(key: key);

  static const routeName = "./detail_manga";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailMangaArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.manga.title.toString()),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(args.manga.imageUrl!),
          Text("Titre du manga : "+ args.manga.title.toString()),
          Text("Type de manga : " + args.manga.type.toString()),
          Text("Rang de Manga : " + args.manga.rank.toString()),
          Text("Score de l'anime : "+ args.manga.score.toString())
        ],
      )),
    );
  }
}

class DetailMangaArgs {
  final MangaApi manga;

  DetailMangaArgs(this.manga);
}
