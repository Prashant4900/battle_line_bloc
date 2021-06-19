import 'package:battle_line/constant/dimensions.dart';
import 'package:battle_line/constant/padding.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:battle_line/routes/move.dart';
import 'package:battle_line/services/firebase/authentication.dart';
import 'package:battle_line/utils/backpress.dart';
import 'package:battle_line/view/screens/auth/signup_screen.dart';
import 'package:battle_line/view/screens/auth/widget/auth_button.dart';
import 'package:battle_line/view/widget/text_field.dart';
import 'package:flutter/material.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  _MyLoginScreenState createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  MyTextStyle _textStyle = MyTextStyle();
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    MyPadding _padding = MyPadding();

    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height,
            padding: _padding.kAuthPage(context),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, \nWelcome Back",
                    style: _textStyle.authHeading(context),
                  ),
                  vSizedBox4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(width: 30, image: AssetImage("assets/icon/facebook.png")),
                      hSizedBox3,
                      Image(width: 30, image: AssetImage("assets/icon/google.png"))
                    ],
                  ),
                  vSizedBox3,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AuthTextField(
                          validator: (val) => val.isEmpty ? "Email Field is not empty" : null,
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        vSizedBox2,
                        AuthTextField(
                          validator: (val) => val.isEmpty ? "Password Field is not empty" : null,
                          controller: _passwordController,
                          hintText: "Password",
                          obscureText: true,
                        ),
                        vSizedBox2,
                        Text(
                          "Forgot Password?",
                          style: _textStyle.bodyText(context),
                        )
                      ],
                    ),
                  ),
                  vSizedBox2,
                  Column(
                    children: [
                      AuthButtonWidget(
                        progress: loading,
                        label: "Login",
                        onTap: () async {
                          setState(() => loading = true);
                          String _email = _emailController.text.trim().toString().toLowerCase();
                          String _password = _passwordController.text.trim().toString();
                          if (_formKey.currentState!.validate())
                            await _authService.signInWithEmailAndPass(email: _email, password: _password);
                          else
                            print("pls provide valid detail");
                          setState(() => loading = false);
                        },
                      ),
                      vSizedBox2,
                      InkWell(
                        onTap: () {
                          moveTo(context, screen: MySignUpScreen());
                        },
                        child: Text(
                          "Create account",
                          style: _textStyle.bodyText(context),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
