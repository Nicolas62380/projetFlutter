import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail des Animes"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.red,
            width: 200,
            height: 200,
          ),
          const Text("Zone premier texte"),
          const Text("Zone deuxieme texte"),
          const Text("Zone troisième texte"),
          const Text("Zone quatrième texte"),
        ],
      )),
    );
  }
}
