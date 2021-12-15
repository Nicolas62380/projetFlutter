import 'package:flutter/material.dart';
import 'package:projetflutter/models/manga_api.dart';
import 'package:projetflutter/widgets/routes/manga/detail_manga.dart';

class Manga extends StatelessWidget {
  const Manga({Key? key, required this.manga}) : super(key: key);

  final MangaApi manga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.only(left: 20, top: 30),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 5),
              borderRadius: const BorderRadius.all(Radius.circular(
                10,
              ))),
          child: Row(
            children: [
              const SizedBox(
                width: 3,
              ),
              Image.network(manga.imageUrl!),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nom :  " + manga.title.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Score : " + manga.score.toString()),
                    ]),
              )
            ],
          )),
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailManga.routeName,
          arguments: DetailMangaArgs(manga),
        );
      },
    );
  }
}
