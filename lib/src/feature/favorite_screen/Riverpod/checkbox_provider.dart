import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/state_model/checkbox_model.dart';

final checkProvider = StateNotifierProvider<checkNotifier , CheckboxModel>( (ref){
  return checkNotifier();
}
);

class checkNotifier extends StateNotifier<CheckboxModel>{

  checkNotifier():super(CheckboxModel(isSelected: false, isAllSelected: false));


  void toggleSingle(){
   state = state.copyWith(isSelected: !state.isSelected);
    debugPrint("Toggled: ${state.isSelected}");
  }
  void toggleAll() {
    final newValue = !state.isAllSelected;
    state = state.copyWith(
      isAllSelected: newValue,
      isSelected: newValue,
    );
  }}