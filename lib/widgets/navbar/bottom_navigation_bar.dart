// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/providers/home_state.dart';

class NavBar extends ConsumerWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      backgroundColor : const Color(0xff212226),
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
      currentIndex: ref.watch(homeStateProvider).selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: const Color(0xff484B54),
      onTap: (index) {
        ref.read(homeStateProvider.notifier).setSelectedIndex(index);
      },
    );
  }
}
