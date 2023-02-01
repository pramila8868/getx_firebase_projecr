import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/bindings/initial_binding.dart';
import 'package:flutter_firebase_getx/config/themes/theme_controller.dart';
import 'package:flutter_firebase_getx/screen/home/home_screen.dart';
import 'package:get/get.dart';

import 'controllers/question_paper/screen/splash_screen.dart';
import 'routes/routes.dart';

// stream-it tells us ser is connected or not with our app
// auth controller-getting the user from the firebase
// getx saves context globally so donot need to pass context
// static variable- it can access by use the class name directly
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  IniitialBinding().dependencies();
  //  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatrorm);
  //await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        // theme: DarkTheme(
        // ).buildDarkTheme(),
        theme: Get.find<ThemeController>().darkTheme,
        getPages: AppRoutes.routes()
        // getPages: [
        //   GetPage(
        //       name: "/", page: () =>  ScreenIntroduction(),
        //       )
        // ],
        //home: HomeScreen(),
        //home: const SplashScreen(),
        );
    // home: DataUploadScreen());
  }
}
// modules of data sent inti the database
// control shift p-command
// upload data to cloud firestore use cloud firestore