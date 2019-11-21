import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import '../model/sign/account_result_model.dart';

abstract class GlobalBaseState {
  Color get themeColor;

  set themeColor(Color color);

  AccountInfo get accountInfo;

  set accountInfo(AccountInfo _accountInfo);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;

  @override
  AccountInfo accountInfo;

  @override
  GlobalState clone() {
    return GlobalState()
      ..themeColor = themeColor
      ..accountInfo = accountInfo;
  }

//  GlobalState.initialState() : accountInfo = null;

}
