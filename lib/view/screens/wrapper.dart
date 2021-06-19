import 'package:battle_line/model/user_model.dart';
import 'package:battle_line/view/screens/auth/login_screen.dart';
import 'package:battle_line/view/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel?>(context);

    // return either the Home or Authenticate widget
    if (_user == null) {
      return MyLoginScreen();
    } else {
      return MyDashboardScreen();
    }
  }
}
