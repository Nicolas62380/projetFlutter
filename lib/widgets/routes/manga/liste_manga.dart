import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/liste_top_manga_api.dart';
import 'package:projetflutter/providers/top_manga_provider.dart';
import 'package:projetflutter/widgets/manga.dart';

class ListeManga extends ConsumerWidget {
  const ListeManga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(topMangaProvider)
        .map(data: _onData, error: _onError, loading: _onLoading);
   
   /*final Dio dio = ref.read(dioProvider);

    final Future<Response> future = dio.get('/top/anime/1/airing');
    future.then((response){

    });
    return Container();*/
  }

  Widget _onData(data) {
    ListeTopMangaApi a = data.value;
    return _Liste(item:a);
  }

  Widget _onError(error) {
    return Container(
      color: Colors.red,
    );
  }

  Widget _onLoading(loading) {
    return Container(
      color: Colors.black12,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _Liste extends StatefulWidget {
  const _Liste({ Key? key, required this.item }) : super(key: key);

  final ListeTopMangaApi item;

  @override
  __ListeState createState() => __ListeState();
}

class __ListeState extends State<_Liste> {

  ScrollController? _scrollController;
bool _showBackToTopButton = false;
 @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController!.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController!.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController!.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: 
        [ListView.builder(
          controller: _scrollController,
          itemCount:widget. item.top.length,
          itemBuilder: (context, position) {
            return Manga(
              manga: widget.item.top[position],
            );
          },
        ),

        _showBackToTopButton == false
          ? SizedBox()
          : Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                  onPressed: _scrollToTop,
                  child: Icon(Icons.arrow_upward),
                ),
            ),
          )
      ],
    );
  }
}
