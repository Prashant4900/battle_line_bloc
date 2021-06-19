import 'package:flutter/cupertino.dart';

class MyPadding {
  EdgeInsetsGeometry kAuthPage(context) {
    EdgeInsetsGeometry kPage = EdgeInsets.only(
      left: 20,
      right: 20,
      top: MediaQuery.of(context).size.height * 0.06,
      bottom: MediaQuery.of(context).size.height * 0.06,
    );
    return kPage;
  }
}
