import 'package:flutter/material.dart';
import 'package:projetflutter/widgets/routes/home/home.dart';
import 'package:projetflutter/widgets/routes/anime/detail_anime.dart';
import 'package:projetflutter/widgets/routes/anime/liste_anime.dart';

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
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/detail_anime': (context) => const Detail(),
        '/liste_anime': (context) => const ListeAnime(),
      },
    );
  }
}
