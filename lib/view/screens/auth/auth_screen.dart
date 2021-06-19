import 'package:battle_line/constant/padding.dart';
import 'package:battle_line/utils/backpress.dart';
import 'package:flutter/material.dart';

class MyAuthLandingScreen extends StatelessWidget {
  const MyAuthLandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPadding _padding = MyPadding();
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: Container(
            width: _width,
            height: _height,
            padding: _padding.kAuthPage(context),
          ),
        ),
      ),
    );
  }
}
