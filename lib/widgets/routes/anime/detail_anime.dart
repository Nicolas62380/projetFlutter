import 'dart:html';

import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class HomeImage extends StatelessWidget {
  const HomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
            const Text("Ceci est un test"),
          ],
        )),
    );
  }
}
