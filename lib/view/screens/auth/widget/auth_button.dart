import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.progress = false,
  }) : super(key: key);

  final String label;
  final Function onTap;
  final bool progress;

  @override
  Widget build(BuildContext context) {
    return progress
        ? Center(child: CircularProgressIndicator())
        : RaisedButton(
            onPressed: onTap as void Function()?,
            elevation: 0,
            padding: EdgeInsets.all(18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
  }
}
