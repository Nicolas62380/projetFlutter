import 'package:flutter/material.dart';
import 'package:projetflutter/models/manga_api.dart';

class DetailManga extends StatelessWidget {
  const DetailManga({Key? key}) : super(key: key);

  static const routeName = "./detail_manga";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailMangaArgs;
    String? imgUrl = args.manga.imageUrl;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.manga.title.toString()),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(image:imgUrl);
              }));
            },
            child: Hero(
              tag: 'imageHero',
                child: Image.network(
                  args.manga.imageUrl!,
                ),
            ),
          ),
          //Image.network(args.manga.imageUrl!),
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

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key,required this.image}) : super(key: key);
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              image!,scale:0.5
            ),
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
