import 'package:flutter/material.dart';
import 'package:flutter_mall/redux/theme_redux.dart';
/**
 * Redux全局State
 * Created by guoshuyu
 * Date: 2018-07-16
 */

///全局Redux store 的对象，保存State数据
class GSYState {
  ///用户信息
  ThemeData themeData;

  ///构造方法
  GSYState({this.themeData});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
GSYState appReducer(GSYState state, action) {
  return GSYState(
    ///通过 UserReducer 将 GSYState 内的 userInfo 和 action 关联在一起
    themeData: ThemeDataReducer(state.themeData, action),

  );
}

// final List<Middleware<GSYState>> middleware = [
//   UserInfoMiddleware(),
// ];
