import 'package:battle_line/constant/colors.dart';
import 'package:battle_line/utils/backpress.dart';
import 'package:battle_line/view/screens/games/games_screen.dart';
import 'package:battle_line/view/screens/home/home_screen.dart';
import 'package:battle_line/view/screens/profile/profile_screen.dart';
import 'package:battle_line/view/screens/store/store_screen.dart';
import 'package:battle_line/view/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MyDashboardScreen extends StatefulWidget {
  const MyDashboardScreen({Key? key}) : super(key: key);

  @override
  _MyDashboardScreenState createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  int _page = 0;

  void _onTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  List<Widget> _screen = [
    MyHomeScreen(),
    MyGamesScreen(),
    MyWalletScreen(),
    MyStoreScreen(),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: _screen[_page],
          bottomNavigationBar: Container(
            height: 70,
            color: MyColors.buttonBackgroundColorDark,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => _onTapped(0),
                  child: Icon(
                    LineIcons.home,
                    size: 30,
                    color: _page == 0 ? MyColors.reddishColor : MyColors.buttonBackgroundColor,
                  ),
                ),
                InkWell(
                  onTap: () => _onTapped(1),
                  child: Icon(
                    LineIcons.gamepad,
                    size: 30,
                    color: _page == 1 ? MyColors.reddishColor : MyColors.buttonBackgroundColor,
                  ),
                ),
                InkWell(
                  onTap: () => _onTapped(2),
                  child: Icon(
                    LineIcons.coins,
                    // UiIcons.money,
                    size: 30,
                    color: _page == 2 ? MyColors.reddishColor : MyColors.buttonBackgroundColor,
                  ),
                ),
                InkWell(
                  onTap: () => _onTapped(3),
                  child: Icon(
                    LineIcons.shoppingBag,
                    size: 30,
                    color: _page == 3 ? MyColors.reddishColor : MyColors.buttonBackgroundColor,
                  ),
                ),
                InkWell(
                  onTap: () => _onTapped(4),
                  child: Icon(
                    LineIcons.userCircle,
                    size: 30,
                    color: _page == 4 ? MyColors.reddishColor : MyColors.buttonBackgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
