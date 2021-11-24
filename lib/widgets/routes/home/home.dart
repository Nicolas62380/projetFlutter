import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        title: const Text("LPDIM FI"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "button cliked : $counter timeqs.",
              style: const TextStyle(fontFamily: 'Lobster'),
            ),
            versliste(),
            versdetail(),
          ],
        ),
      ),

    );
  }
}

class versliste extends StatelessWidget {
  const versliste({
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
class versdetail extends StatelessWidget {
  const versdetail({
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
