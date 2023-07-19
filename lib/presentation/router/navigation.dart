import 'package:flutter/material.dart';

class Navigation {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> push(String routeName, {dynamic arguments}) async {
   return await navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static void pop<T>({T? result}) {
    if (canPop) return navigatorKey.currentState?.pop(result);
  }

  static BuildContext? get context => navigatorKey.currentContext;

  static bool get canPop => navigatorKey.currentState?.canPop() ?? false;

  static void popToRoot() => navigatorKey.currentState?.popUntil((route) => route.isFirst);
}
