import 'package:flutter/material.dart';
import 'package:projetflutter/models/manga_api.dart';

class Manga extends StatelessWidget {
  const Manga({Key? key, required this.manga}) : super(key: key);

  final MangaApi manga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:Container(
        margin: const EdgeInsets.only(left: 20, top: 30),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 5),
            borderRadius: const BorderRadius.all(Radius.circular(
              10,
            ))),
        child: Row(
          children: [
            const SizedBox(
              width: 3,
            ),
            Image.network(manga.image_url!),
            const SizedBox(width: 32),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Nom :  " + manga.title.toString()),
              const SizedBox(
                height: 10,
              ),
              Text("Score : " + manga.score.toString()),
            ])
          ],
        )),
      onTap: () { 
        Navigator.pushNamed(
        context,
        ExtractArgumentsScreen.routeName,
        arguments: ScreenArguments(
          manga,
        ),
        );
      },
    );
  }
}

class ScreenArguments {
  final MangaApi manga;

  ScreenArguments(this.manga);
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  static const routeName = '/detail_manga';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Détail du manga :"),
      ),
      body: Center(
        child: Row(
          children: [
            Text("Rank : " + args.manga.rank.toString()),
            Text("Image : "),
            Image.network(args.manga.image_url!),
            Text("Title : " + args.manga.title.toString()),
            Text("Type : " + args.manga.type.toString()),
            Text("Volumes : " + args.manga.volumes.toString()),
            Text("Date de début : " + args.manga.start_date.toString()),
            Text("Date de fin : " + args.manga.end_date.toString()),
            ],
        )
        
      ),
    );
  } 
}