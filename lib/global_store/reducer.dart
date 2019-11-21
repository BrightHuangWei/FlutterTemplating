import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import '../model/sign/account_result_model.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
      GlobalAction.saveAccountInfo: _onSaveAccountInfo,
    },
  );
}

List<Color> _colors = <Color>[
  Colors.green,
  Colors.red,
  Colors.black,
  Colors.blue
];

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  final Color next =
      _colors[((_colors.indexOf(state.themeColor) + 1) % _colors.length)];
  return state.clone()..themeColor = next;
}

GlobalState _onSaveAccountInfo(GlobalState state, Action action) {
  final AccountInfo info = action.payload ?? AccountInfo();
  return state.clone()..accountInfo = info;
}
