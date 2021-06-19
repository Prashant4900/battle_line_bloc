import 'package:battle_line/routes/route_name.dart';
import 'package:battle_line/view/screens/auth/auth_screen.dart';
import 'package:battle_line/view/screens/auth/login_screen.dart';
import 'package:battle_line/view/screens/auth/signup_screen.dart';
import 'package:battle_line/view/screens/dashboard_screen.dart';
import 'package:battle_line/view/screens/error/error_page.dart';
import 'package:battle_line/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouterGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // extra
      case RouteName.splashRoute:
        return myPrivateRoute(screen: MySplashScreen());

      // auth
      case RouteName.loginRoute:
        return myPrivateRoute(screen: MyLoginScreen());
      case RouteName.signupRoute:
        return myPrivateRoute(screen: MySignUpScreen());
      case RouteName.authRoute:
        return myPrivateRoute(screen: MyAuthLandingScreen());

      // home
      case RouteName.dashboardRoute:
        return myPrivateRoute(screen: MyDashboardScreen(), transition: PageTransitionType.fade);

      // error
      default:
        return myPrivateRoute(screen: MyErrorPage());
    }
  }
}

myPrivateRoute({required Widget screen, RouteSettings? args, PageTransitionType? transition, int? duration}) {
  return PageTransition(
    child: screen,
    settings: args,
    type: transition ?? PageTransitionType.rightToLeft,
    duration: Duration(milliseconds: duration ?? 500),
  );
}
