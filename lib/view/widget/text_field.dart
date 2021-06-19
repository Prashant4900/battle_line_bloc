import 'package:battle_line/constant/colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({Key? key, this.hintText, this.obscureText, this.controller, this.validator}) : super(key: key);
  final bool? obscureText;
  final String? hintText;
  final TextEditingController? controller;
  final Function? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator as String? Function(String?)?,
        obscureText: obscureText ?? false,
        cursorColor: MyColors.textColor,
        decoration: InputDecoration(border: InputBorder.none, hintText: hintText),
      ),
    );
  }
}
