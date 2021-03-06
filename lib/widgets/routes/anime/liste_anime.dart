import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/liste_top_api.dart';
import 'package:projetflutter/providers/top_anime_provider.dart';
import 'package:projetflutter/widgets/anime.dart';

class ListeAnime extends ConsumerWidget {
  const ListeAnime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(topAnimeProvider)
        .map(data: _onData, error: _onError, loading: _onLoading);
  }

  Widget _onData(data) {
    ListeTopApi a = data.value;
    return _Liste(item: a);
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
  const _Liste({Key? key, required this.item}) : super(key: key);

  final ListeTopApi item;

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
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          itemCount: widget.item.top.length,
          itemBuilder: (context, position) {
            return AnimeRow(
              anime: widget.item.top[position],
            );
          },
        ),
        _showBackToTopButton == false
            ? const SizedBox()
            : Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xffff8f00),
                    onPressed: _scrollToTop,
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
              )
      ],
    );
  }
}
