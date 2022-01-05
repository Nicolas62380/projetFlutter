import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final mangaFavProvider = Provider<String>((ref) {
  final box = GetStorage();
  final value = box.read('MonMangaFav');
  return value ?? "";
});
