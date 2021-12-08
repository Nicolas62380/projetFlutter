import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime"),
      ),
      body: Center(
        child: Column(
          children: const [
            Versliste(),
            Versdetail(),
          ],
        ),
      ),
    );
  }
}

class Versliste extends StatelessWidget {
  const Versliste({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/liste_anime");
      },
      child: const Text("LISTE"),
    );
  }
}

class Versdetail extends StatelessWidget {
  const Versdetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/detail_anime");
      },
      child: const Text("Detail"),
    );
  }
}
