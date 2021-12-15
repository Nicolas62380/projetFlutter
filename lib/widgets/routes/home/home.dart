import 'package:flutter/material.dart';
import 'package:projetflutter/widgets/liste/liste_deroulante.dart';
import 'package:projetflutter/widgets/navbar/bottom_navigation_bar.dart';

import 'package:projetflutter/widgets/routes/anime/liste_anime.dart';
import 'package:projetflutter/widgets/routes/manga/liste_manga.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: AppBar(
        leading: Image.asset(
          'assets/icon/icon.png',
        ),
        title: Text(_selectedIndex == 0 ? "Anime" : "Manga"),
        centerTitle: true,
        ListeDeroulante(), 
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
