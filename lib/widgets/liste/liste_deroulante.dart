import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/providers/home_state.dart';
import 'package:projetflutter/providers/top_anime_provider.dart';

class ListeDeroulante extends ConsumerWidget {
  ListeDeroulante({Key? key}) : super(key: key);

  final List<int> options = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: DropdownButton<int>(
        value: ref.watch(homeStateProvider).pageAnime,
        onChanged: (int? newValue) {
          ref.read(homeStateProvider.notifier).setPageAnime(newValue!);
          ref.refresh(topAnimeProvider);
        },
        style: const TextStyle(color: Colors.blue),
        selectedItemBuilder: (BuildContext context) {
          return options.map((int value) {
            return Text(
              ref.watch(homeStateProvider).pageAnime.toString(),
              style: const TextStyle(color: Colors.white),
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
