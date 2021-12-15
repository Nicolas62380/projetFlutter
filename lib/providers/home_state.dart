import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  int pageAnime = 1;
  int pageManga = 1;
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(HomeState());

  void setPageAnime(int newValue) {
    final newState = HomeState();
    newState.pageManga = state.pageManga;
    newState.pageAnime = newValue;

    state = newState;
  }
}

final homeStateProvider =
    StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier();
});
