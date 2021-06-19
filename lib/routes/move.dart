import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

replaceTo(context, {Widget? screen}) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen!),
  );
}

moveTo(context, {required Widget screen, Object? arguments}) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
      settings: RouteSettings(
        arguments: arguments,
      ),
    ),
  );
}
