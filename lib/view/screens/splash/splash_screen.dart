import 'dart:async';
import 'package:battle_line/constant/colors.dart';
import 'package:battle_line/routes/move.dart';
import 'package:battle_line/routes/route_name.dart';
import 'package:battle_line/view/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    // screenChange();
    Timer(
      Duration(milliseconds: 5000),
      () {
        moveTo(context, screen: MyDashboardScreen());
        // Navigator.popAndPushNamed(context, RouteName.dashboardRoute);
        // Get.offAndToNamed(RouteName.loginRoute);
      },
    );
  }

  Future screenChange() async {
    await Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.popAndPushNamed(context, RouteName.loginRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.kBlackColor,
        body: Center(
          child: CircularProgressIndicator(),
          // child: MyCircularProgressBar(),
        ),
      ),
    );
  }
}
