import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextStyle {
  TextStyle authHeading(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: MediaQuery.of(context).size.width * 0.1,
        );
  }

  TextStyle? smallText(BuildContext context) {
    return Theme.of(context).textTheme.caption;
  }

  TextStyle? xSmallText(BuildContext context) {
    return Theme.of(context).textTheme.overline;
  }

  TextStyle? bodyText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1;
  }

  TextStyle? bodyLargeText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          // color: MyColors.textColor,
        );
  }

  TextStyle appBarText(BuildContext context) {
    return Theme.of(context).textTheme.headline5!.copyWith(
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle labelText(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle labelMediumText(BuildContext context) {
    return Theme.of(context).textTheme.headline5!.copyWith(
          fontWeight: FontWeight.bold,
        );
  }

  TextStyle labelLargeText(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
          fontWeight: FontWeight.bold,
        );
  }
}
