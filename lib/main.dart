import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/providers/dio.dart';
import 'package:projetflutter/providers/test_dio.provider.dart';
import 'package:projetflutter/widgets/routes/home/home.dart';
import 'package:projetflutter/widgets/routes/anime/detail_anime.dart';
import 'package:projetflutter/widgets/routes/anime/liste_anime.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: ' Demo',
        home: ProviderScope(
          child: /*const Home()*/ TestDio(),
          /*routes: {
        '/home': (context) => const Home(),
        '/detail_anime': (context) => const Detail(),
        '/liste_anime': (context) => const ListeAnime(),
      },*/
        ));
  }
}

class TestDio extends ConsumerWidget {
  const TestDio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
      .read(testDioProvider)
      .map(data: _onData,error: _onError,loading: _onLoading);
    /*final Dio dio = ref.read(dioProvider);

    final Future<Response> future = dio.get('/top/anime/1/airing');
    future.then((response){

    });
    return Container();*/
  }

  Widget _onData(data){
    return Container(
      color: Colors.blue,
    );
  }

  Widget _onError(error){
    return Container(
      color: Colors.red,
    );
  }

  Widget _onLoading(loading){
    return Container(
      color: Colors.green,
    );
  }
}
