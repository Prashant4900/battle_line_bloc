import 'package:flutter/material.dart';

class MyGamesScreen extends StatelessWidget {
  const MyGamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'fame',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
