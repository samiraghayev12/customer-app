import 'package:customer/presentation/router/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin BasePage implements StatelessWidget {
  AppBar? appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: actions(context),
      titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
      automaticallyImplyLeading: false,
      leading: leading(context) ??
          IconButton(
            icon: const Icon(CupertinoIcons.arrow_left, color: Colors.black),
            onPressed: () => Navigation.pop(),
          ),
      title: title(context),
      elevation: 0,
    );
  }

  Widget? title(BuildContext context) => null;

  Widget? body(BuildContext context) => null;

  Widget? leading(BuildContext context) => null;

  List<Widget>? actions(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(context),
      body: body(context),
      backgroundColor: Colors.white,
    );
  }
}
