import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/anime_api.dart';
import 'package:projetflutter/models/liste_top_api.dart';
import 'package:projetflutter/providers/dio.dart';
import 'package:projetflutter/providers/test_dio.provider.dart';
import 'package:projetflutter/widgets/anime.dart';
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
        home: const ProviderScope(child: MyStatefulWidget()),
        routes: {
          '/home': (context) => const Home(),
          /*'/detail_anime': (context) => const Detail(),*/
          '/liste_anime': (context) => const ListeAnime(),
        });
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ListeAnime(),
    Text(
      'Index 1: Business',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_outlined),
            label: 'Anime',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Manga',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[1800],
        onTap: _onItemTapped,
      ),
    );
  }
}
