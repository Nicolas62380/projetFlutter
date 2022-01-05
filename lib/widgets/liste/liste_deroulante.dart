import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/providers/home_state.dart';
import 'package:projetflutter/providers/top_anime_provider.dart';
import 'package:projetflutter/providers/top_manga_provider.dart';

class ListeDeroulante extends ConsumerWidget {
  ListeDeroulante({Key? key}) : super(key: key);

  final List<int> options = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xff212226),
      child: DropdownButton<int>(
        value: ref.read(homeStateProvider).selectedIndex == 0
            ? ref.watch(homeStateProvider).pageAnime
            : ref.watch(homeStateProvider).pageManga,
        onChanged: (int? newValue) {
          var selectedIndex = ref.read(homeStateProvider).selectedIndex;
          switch (selectedIndex) {
            case 0:
              ref.read(homeStateProvider.notifier).setPageAnime(newValue!);
              ref.refresh(topAnimeProvider);
              break;
            case 1:
              ref.read(homeStateProvider.notifier).setPageManga(newValue!);
              ref.refresh(topMangaProvider);
              break;
          }
        },
        style: const TextStyle(color: Color(0xff212226)),
        selectedItemBuilder: (BuildContext context) {
          return options.map((int value) {
            return Text(
              ref.read(homeStateProvider).selectedIndex == 0
                  ? ref.watch(homeStateProvider).pageAnime.toString()
                  : ref.watch(homeStateProvider).pageManga.toString(),
              style: const TextStyle(color: Color.fromARGB(255, 255, 143, 0)),
            );
          }).toList();
        },
        items: options.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }
}
