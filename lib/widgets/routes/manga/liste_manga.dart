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

    return ListView.builder(
      itemCount: a.top.length,
      itemBuilder: (context, position) {
        return Manga(
          manga: a.top[position],
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
