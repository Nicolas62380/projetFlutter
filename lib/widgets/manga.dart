import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projetflutter/models/manga_api.dart';
import 'package:projetflutter/providers/manga_fav_provider.dart';
import 'package:projetflutter/widgets/routes/manga/detail_manga.dart';

class Manga extends StatelessWidget {
  Manga({Key? key, required this.manga}) : super(key: key);

  final MangaApi manga;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(
                10,
              )),
              color : const Color(0xff424549),),
          child: Row(
            children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(manga.imageUrl!),
              ),
              const SizedBox(
                width: 3,
              ),
              //Image.network(manga.imageUrl!),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(manga.title.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ("Rang : " + manga.rank.toString()),
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white)
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Score : " + manga.score.toString(),
                      style: const TextStyle(color: Colors.white)),
                      Consumer(
                        builder: (context, ref, child) {
                          var name = ref.watch(mangaFavProvider);

                          final isFavorite = name == manga.title;

                          return GestureDetector(
                            onTap: () {
                              if (!isFavorite) {
                                box.write('MonMangaFav', manga.title).then(
                                    (value) => ref.refresh(mangaFavProvider));
                              } else {
                                box.remove('MonMangaFav').then(
                                    (value) => ref.refresh(mangaFavProvider));
                              }
                            },
                            child: Icon(isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined),
                          );
                        },
                      ),
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
