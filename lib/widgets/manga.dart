import 'package:flutter/material.dart';
import 'package:projetflutter/models/manga_api.dart';

class Manga extends StatelessWidget {
  const Manga({Key? key, required this.manga}) : super(key: key);

  final MangaApi manga;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Image.network(manga.image_url!),
            const SizedBox(width: 32),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Nom :  " + manga.title.toString()),
              const SizedBox(
                height: 10,
              ),
              Text("Score : " + manga.score.toString()),
            ])
          ],
        ));
  }
}