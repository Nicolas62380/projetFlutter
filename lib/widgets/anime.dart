import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/models/anime_api.dart';

class AnimeRow extends StatelessWidget {
  const AnimeRow({Key? key, required this.anime}) : super(key: key);

  final AnimeApi anime;

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
            Image.network(anime.image_url!),
            const SizedBox(width: 32),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Nom :  " + anime.title.toString()),
              const SizedBox(
                height: 10,
              ),
              Text("Score : " + anime.score.toString()),
            ])
          ],
        ));
  }
}
