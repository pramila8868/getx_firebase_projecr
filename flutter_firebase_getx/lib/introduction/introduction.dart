// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/app_colors.dart';
import 'package:flutter_firebase_getx/screen/home/home_screen.dart';
import 'package:flutter_firebase_getx/widget/app_circle_button.dart';
import 'package:get/get.dart';

import '../widget/app_circle_button.dart';

class ScreenIntroduction extends StatelessWidget {
  const ScreenIntroduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(
                Icons.star,
                size: 65,
                //color: Colors.amber,
              ),
              const Text(
                "This is a study app. You can use it as you want",
                style: TextStyle(
                    color: onSurfaceTextColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              AppCircleButton(
                // ignore: prefer_const_constructors
                child: InkWell(
                  onTap: () {
                    Get.to(HomeScreen());
                    //Get.to("/home");
                  },
                  //onTap: () => Get.to("home"),
                  child: const Icon(
                    //Icons.abc_outlined,
                    Icons.arrow_forward,
                    size: 35,
                    // color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
