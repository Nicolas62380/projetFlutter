import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/widgets/navbar/navbar.dart';
import 'package:projetflutter/widgets/routes/home/home.dart';
import 'package:projetflutter/widgets/routes/anime/liste_anime.dart';
import 'package:projetflutter/widgets/routes/manga/liste_manga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: ' Demo',
        home: const ProviderScope(child: MyStatefulWidget()),
        routes: {
          '/home': (context) => const Home(),
          '/detail_manga': (context) => const ListeManga(),
          '/liste_anime': (context) => const ListeAnime(),
        });
  }
}
