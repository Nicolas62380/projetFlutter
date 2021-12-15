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
          Text("Titre du manga : " + args.manga.title.toString()),
          Text("Type de manga : " + args.manga.type.toString()),
          Text("Rang du manga : " + args.manga.rank.toString()),
          Text("Score du manga : " + args.manga.score.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Début : " + args.manga.startDate.toString()),
              const SizedBox(
                width: 20,
              ),
              Text("Fin : " + args.manga.endDate.toString()),
            ],
          ),
        ],
      )),
    );
  }
}

class DetailMangaArgs {
  final MangaApi manga;

  DetailMangaArgs(this.manga);
}
