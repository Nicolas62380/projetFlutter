import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/models/liste_top_manga_api.dart';
import 'package:projetflutter/models/manga_api.dart';
import 'package:projetflutter/models/liste_top_api.dart';
import 'package:projetflutter/providers/dio.dart';

final topMangaProvider = FutureProvider<ListeTopMangaApi?>((ref) async {
  final Dio dio = ref.read(dioProvider);

  try {
    final Response response = await dio.get('/top/manga/1');
    return ListeTopMangaApi.fromJson(response.data);
  } catch (e) {
    return Future.error(e);
  }
});

//async permet de ne pas attendre que la fonction aie terminé son travail (tourne en fond)