import 'package:fish_redux/fish_redux.dart';
import '../model/sign/account_result_model.dart';

import 'action.dart';
import 'state.dart';

Effect<GlobalState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalState>>{
    GlobalAction.getAccountInfo: _getAccountInfo,
  });
}

AccountInfo _getAccountInfo(Action action, Context<GlobalState> ctx) {
  return ctx.state.accountInfo;
}
