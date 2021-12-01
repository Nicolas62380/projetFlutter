import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/liste_anime_api.dart';
import 'package:projetflutter/providers/dio.dart';

//final testDioProvider = FutureProvider<?>((ref) async {
final testDioProvider = FutureProvider<ListeAnimeApi?>((ref) async {
  final Dio dio = ref.read(dioProvider);

  try{
    final Response response = await dio.get('/top/anime/1/airing');
    return ListeAnimeApi.fromJson(jsonDecode(response.data.toString()));
  }catch(e){
    return null;
  }

  /*return dio
    .get('/top/anime/1/airing')
    .then((value)=>value)
    .onError((error, stackTrace)=>Future.error(error!));*/
  //return Example.fromJson(jsonDecode(response.data.toString()));
});

//async permet de ne pas attendre que la fonction aie terminé son travail (tourne en fond)