import 'package:flutter/material.dart';
import 'package:projetflutter/models/anime_api.dart';
import 'package:projetflutter/widgets/routes/anime/detail_anime.dart';

class AnimeRow extends StatelessWidget {
  const AnimeRow({Key? key, required this.anime}) : super(key: key);

  final AnimeApi anime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailAnime.routeName,
          arguments: DetailAnimeArgs(anime),
        );
      },
      child: Container(
          margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(
                10,
              )),
              color : Color(0xff424549),
              ),
          child: Row(
            children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(anime.imageUrl!),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anime.title.toString(),
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white)
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ("Rang : " + anime.rank.toString()),
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white)
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Score : " + anime.score.toString(),
                      style: const TextStyle(color: Colors.white)
                      ),
                    ]),
              )
            ],
          )),
    );
  }
}
