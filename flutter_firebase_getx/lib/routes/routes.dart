import 'package:flutter_firebase_getx/controllers/question_paper/screen/splash_screen.dart';
import 'package:flutter_firebase_getx/controllers/question_paper_controller.dart';
import 'package:flutter_firebase_getx/controllers/zoom_drawer_controller.dart';
import 'package:flutter_firebase_getx/screen/home/home_screen.dart';
import 'package:flutter_firebase_getx/screen/login/login_screen.dart';
import 'package:get/get.dart';

import '../introduction/introduction.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
        ),
        GetPage(name: "/introduction", page: () => const ScreenIntroduction()),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen())
      ];
}
