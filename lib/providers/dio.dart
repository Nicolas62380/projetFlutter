import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Dio dio = Dio(BaseOptions(
    baseUrl: "https://api.jikan.moe/v3",
    connectTimeout: 1000,
    receiveTimeout: 5000,
    sendTimeout: 5000));

final dioProvider = Provider<Dio>((ref) {
  return dio;
});
