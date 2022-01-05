import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final animeFavProvider = Provider<String>((ref) {
  final box = GetStorage();
  final value = box.read('MonAnimeFav');
  return value ?? "";
});
