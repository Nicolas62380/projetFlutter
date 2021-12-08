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
          Image.network(args.manga.image_url!),
          Text(args.manga.title.toString()),
          Text(args.manga.type.toString()),
          Text(args.manga.rank.toString()),
          Text(args.manga.score.toString())
        ],
      )),
    );
  }
}

class DetailMangaArgs {
  final MangaApi manga;

  DetailMangaArgs(this.manga);
}
