import 'package:battle_line/constant/colors.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBarWidet extends StatelessWidget {
  const MyAppBarWidet({
    Key? key,
    String? textTitle1,
    String? textTitle2,
    List<Widget>? action,
  })  : _textTitle1 = textTitle1,
        _textTitle2 = textTitle2,
        _action = action,
        super(key: key);

  final String? _textTitle1;
  final String? _textTitle2;
  final List<Widget>? _action;

  @override
  Widget build(BuildContext context) {
    MyTextStyle _textStyle = MyTextStyle();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MyColors.buttonBackgroundColorDark,
      title: RichText(
        text: TextSpan(
          style: _textStyle.appBarText(context),
          children: [
            TextSpan(text: _textTitle1 ?? "", style: TextStyle(color: MyColors.bodyColor)),
            TextSpan(text: _textTitle2 ?? "", style: TextStyle(color: MyColors.reddishColor)),
          ],
        ),
      ),
      actions: _action,
    );
  }
}
