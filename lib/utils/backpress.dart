import 'dart:io';

DateTime? backbuttonpressedTime;

Future<bool> onWillPop() async {
  DateTime currentTime = DateTime.now();

  //Statement 1 Or statement2
  bool backButton = backbuttonpressedTime == null || currentTime.difference(backbuttonpressedTime!) > Duration(seconds: 3);

  if (backButton) {
    backbuttonpressedTime = currentTime;

    // TODO: Snackbar
    // Fluttertoast.showToast(
    //     msg: "This is Center Short Toast",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0);

    // SnackBar(
    //   behavior: SnackBarBehavior.floating,
    //   elevation: 10,
    //   backgroundColor: MyColors.kClipColor,
    //   content: Text('Double Press to Exit'),
    // );

    // Get.snackbar(
    //   "Exit App",
    //   'Double Press to Exit',
    //   snackPosition: SnackPosition.BOTTOM,
    //   margin: EdgeInsets.only(bottom: 20),
    //   backgroundColor: MyColors.kClipColor,
    //   duration: Duration(milliseconds: 3000),
    // );

    return false;
  }
  return exit(0);
}
