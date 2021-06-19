import 'package:battle_line/constant/dimensions.dart';
import 'package:battle_line/constant/padding.dart';
import 'package:battle_line/constant/textstyle.dart';
import 'package:battle_line/services/firebase/authentication.dart';
import 'package:battle_line/view/screens/auth/widget/auth_button.dart';
import 'package:battle_line/view/widget/text_field.dart';
import 'package:flutter/material.dart';

class MySignUpScreen extends StatefulWidget {
  const MySignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MySignUpScreenState createState() => _MySignUpScreenState();
}

class _MySignUpScreenState extends State<MySignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    MyPadding _padding = MyPadding();
    MyTextStyle _textStyle = MyTextStyle();

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: _padding.kAuthPage(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Create, \nNew Account",
                  style: _textStyle.authHeading(context),
                ),
                vSizedBox4,
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AuthTextField(
                        controller: _nameController,
                        validator: (val) => val.isEmpty ? "Name Field is not empty" : null,
                        hintText: "Full Name",
                      ),
                      vSizedBox2,
                      AuthTextField(
                        controller: _emailController,
                        validator: (val) => val.isEmpty ? "Email Field is not empty" : null,
                        hintText: "Email",
                      ),
                      vSizedBox2,
                      AuthTextField(
                        controller: _passwordController,
                        validator: (val) => val.isEmpty ? "Password Field is not empty" : null,
                        hintText: "Password",
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                vSizedBox3,
                Column(
                  children: [
                    AuthButtonWidget(
                      progress: loading,
                      label: "Signup",
                      onTap: () async {
                        setState(() => loading = true);
                        String _email = _emailController.text.toString();
                        String _password = _passwordController.text.trim().toString();

                        if (_formKey.currentState!.validate())
                          await _authService.registerWithEmailAndPass(email: _email, password: _password);
                        else
                          print("pls provide valid detail");
                        setState(() => loading = false);
                      },
                    ),
                    vSizedBox2,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // Get.back();
                      },
                      child: Text(
                        "Already have account?",
                        style: _textStyle.bodyText(context),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
