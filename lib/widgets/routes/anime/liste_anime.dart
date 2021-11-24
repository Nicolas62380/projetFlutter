import 'package:flutter/material.dart';

class ListeAnime extends StatefulWidget {
  const ListeAnime({Key? key}) : super(key: key);

  @override
  State<ListeAnime> createState() => _ListeAnime();
}

class _ListeAnime extends State<ListeAnime> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste Animes"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Text("Item N°$index");
        },
      ),
    );
  }
}