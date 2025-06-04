


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morsl_app_celina0057/src/feature/Parents_screen/riverpod/dummy_screen.dart';
import 'package:morsl_app_celina0057/src/feature/Parents_screen/state_model/state.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/view/favorite_screen.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class ParentsScreenProvider extends StateNotifier<ParentScreenRiverPodModel> {
  ParentsScreenProvider() : super(const ParentScreenRiverPodModel());

  final List<Widget> _pageList = [
    Home(),
    FavoriteScreen(),
    Reset(),
    Settings(),
  ];

  List<Widget> get pageList => _pageList;

  void onSelectedIndex(int index) {
    debugPrint("Selected Page index : $index");
    state = state.copyWith(selectedIndex: index);
  }
}

final parentsScreenProvider =
    StateNotifierProvider<ParentsScreenProvider, ParentScreenRiverPodModel>((ref) {
  return ParentsScreenProvider();
});