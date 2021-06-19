import 'package:flutter/material.dart';

class MyCircularProgressBar extends StatefulWidget {
  MyCircularProgressBar({Key? key}) : super(key: key);

  @override
  _MyCircularProgressBarState createState() => _MyCircularProgressBarState();
}

class _MyCircularProgressBarState extends State<MyCircularProgressBar> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(
        valueColor: _animationController.drive(ColorTween(begin: Colors.blueAccent, end: Colors.red)),
      ),
    );
  }
}
