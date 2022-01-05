import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/anime_api.dart';
import 'package:projetflutter/providers/anime_fav_provider.dart';
import 'package:projetflutter/widgets/routes/anime/detail_anime.dart';
import 'package:get_storage/get_storage.dart';

class AnimeRow extends StatelessWidget {
  AnimeRow({Key? key, required this.anime}) : super(key: key);

  final AnimeApi anime;
  final box = GetStorage();

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
              border: Border.all(color: Colors.blueAccent, width: 5),
              borderRadius: const BorderRadius.all(Radius.circular(
                10,
              ))),
          child: Row(
            children: [
              const SizedBox(
                width: 3,
              ),
              Image.network(anime.imageUrl!),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anime.title.toString(),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ("Rang : " + anime.rank.toString()),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Score : " + anime.score.toString()),
                      Consumer(
                        builder: (context, ref, child) {
                          var name = ref.watch(animeFavProvider);

                          final isFavorite = name == anime.title;

                          return GestureDetector(
                            onTap: () {
                              if (!isFavorite) {
                                box.write('MonAnimeFav', anime.title).then(
                                    (value) => ref.refresh(animeFavProvider));
                              } else {
                                box.remove('MonAnimeFav').then(
                                    (value) => ref.refresh(animeFavProvider));
                              }
                            },
                            child: Icon(isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined),
                          );
                        },
                      )
                    ]),
              )
            ],
          )),
    );
  }
}
