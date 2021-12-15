import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  int pageAnime = 1;
  int pageManga = 1;
  int selectedIndex = 0;
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(HomeState());

  void setPageAnime(int newValue) {
    final newState = HomeState();
    newState.pageManga = state.pageManga;
    newState.pageAnime = newValue;
    newState.selectedIndex = state.selectedIndex;
    state = newState;
  }

  void setSelectedIndex(int index) {
    final newState = HomeState();
    newState.pageManga = state.pageManga;
    newState.pageAnime = state.pageAnime;
    newState.selectedIndex = index;
    state = newState;
  }

  void setPageManga(int newValue) {
    final newState = HomeState();
    newState.pageAnime = state.pageAnime;
    newState.pageManga = newValue;
    newState.selectedIndex = state.selectedIndex;
    state = newState;
  }
}

final homeStateProvider =
    StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier();
});
