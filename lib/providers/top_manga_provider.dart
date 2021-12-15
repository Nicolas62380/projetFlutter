import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/liste_top_manga_api.dart';
import 'package:projetflutter/providers/dio.dart';
import 'package:projetflutter/providers/home_state.dart';

final topMangaProvider = FutureProvider<ListeTopMangaApi?>((ref) async {
  final Dio dio = ref.read(dioProvider);
  final pageManga = ref.read(homeStateProvider).pageManga;

  try {
    final Response response = await dio.get('/top/manga/$pageManga');
    return ListeTopMangaApi.fromJson(response.data);
  } catch (e) {
    return Future.error(e);
  }
});

//async permet de ne pas attendre que la fonction aie terminé son travail (tourne en fond)