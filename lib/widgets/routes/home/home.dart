import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/providers/home_state.dart';
import 'package:projetflutter/widgets/liste/liste_deroulante.dart';
import 'package:projetflutter/widgets/navbar/bottom_navigation_bar.dart';

import 'package:projetflutter/widgets/routes/anime/liste_anime.dart';
import 'package:projetflutter/widgets/routes/manga/liste_manga.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  static const List<Widget> _widgetOptions = <Widget>[
    ListeAnime(),
    ListeManga(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor : const Color(0xFF212226),
        leading: Image.asset(
          'assets/icon/icon.png',
        ),
        title: Text(ref.watch(homeStateProvider).selectedIndex == 0
            ? "Anime"
            : "Manga"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListeDeroulante(),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions
            .elementAt(ref.watch(homeStateProvider).selectedIndex),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
