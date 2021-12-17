import 'package:flutter/material.dart';

class RouterHelper{
  RouterHelper._();
  static RouterHelper router = RouterHelper._();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  pushNamed(String routeName){
    navigatorKey.currentState.pushNamed(routeName);
  }
  pushReplacementNamed(String routeName){
    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  pushNamedAndRemoveUntil(String routeName){
    navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
  pop(){
    navigatorKey.currentState.pop();
  }
}