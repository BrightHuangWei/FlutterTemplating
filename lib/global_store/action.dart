import 'package:fish_redux/fish_redux.dart';
import '../model/sign/account_result_model.dart';

enum GlobalAction { changeThemeColor, saveAccountInfo, getAccountInfo }

class GlobalActionCreator {
  static Action onchangeThemeColor() {
    return const Action(GlobalAction.changeThemeColor);
  }

  static Action onSaveAccountInfo(AccountInfo info) {
    return Action(
      GlobalAction.saveAccountInfo,
      payload: info,
    );
  }
}
