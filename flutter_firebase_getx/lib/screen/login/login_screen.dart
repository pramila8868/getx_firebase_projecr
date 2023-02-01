import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/app_colors.dart';
import 'package:flutter_firebase_getx/controllers/auth_controller.dart';
import 'package:flutter_firebase_getx/controllers/question_paper_controller.dart';
import 'package:flutter_firebase_getx/widget/common/main_button.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "",
              width: 200,
              height: 200,
            ),
            Text("This is a study app, You can use as you want"),
            MainButton(
                onTap: () {
                  controller.signInWithGoogle();
                },
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: Icon(Icons.golf_course),
                    ),
                    Text("Sign in with Google")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
