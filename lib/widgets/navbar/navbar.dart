import 'package:flutter/material.dart';
import 'package:projetflutter/widgets/routes/manga/liste_manga.dart';

import '../routes/anime/liste_anime.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbar();
}

/// This is the private State class that goes with MyStatefulWidget.
class _navbar extends State<navbar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ListeAnime(),
    ListeManga(),
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


