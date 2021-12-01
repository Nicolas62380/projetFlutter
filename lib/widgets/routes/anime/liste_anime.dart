import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/liste_top_api.dart';
import 'package:projetflutter/providers/test_dio.provider.dart';
import 'package:projetflutter/widgets/anime.dart';

class ListeAnime extends ConsumerWidget {
  const ListeAnime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(testDioProvider)
        .map(data: _onData, error: _onError, loading: _onLoading);
    /*final Dio dio = ref.read(dioProvider);

    final Future<Response> future = dio.get('/top/anime/1/airing');
    future.then((response){

    });
    return Container();*/
  }

  Widget _onData(data) {
    ListeTopApi a = data.value;

    return ListView.builder(
      itemCount: a.top.length,
      itemBuilder: (context, position) {
        return AnimeRow(
          anime: a.top[position],
        );
      },
    );
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
