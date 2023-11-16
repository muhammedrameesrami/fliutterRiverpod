import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

class UserNotifier extends StateNotifier<Model> {
  UserNotifier(super.state);
  void UpdateName(String newValue) {
    state = state.copyWith(name: newValue);
  }

  void UpdateAddress(String newValue) {
    state = state.copyWith(address: newValue);
  }
}
