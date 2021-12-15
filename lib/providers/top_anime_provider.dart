import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/liste_top_api.dart';
import 'package:projetflutter/providers/dio.dart';

//final testDioProvider = FutureProvider<?>((ref) async {
final topAnimeProvider = FutureProvider<ListeTopApi?>((ref) async {
  final Dio dio = ref.read(dioProvider);
  
  try {
    final Response response = await dio.get('/top/anime/1');
    return ListeTopApi.fromJson(response.data);
  } catch (e) {
    return Future.error(e);
  }
});

//async permet de ne pas attendre que la fonction aie terminé son travail (tourne en fond)