//import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/app_colors.dart';
import 'package:flutter_firebase_getx/config/themes/ui_parameter.dart';
//import 'package:charcode/charcode.dart

import 'package:flutter_firebase_getx/controllers/question_paper_controller.dart';
import 'package:flutter_firebase_getx/controllers/zoom_drawer_controller.dart';
import 'package:flutter_firebase_getx/screen/home/menu_screen.dart';
import 'package:flutter_firebase_getx/screen/home/question_card.dart';
import 'package:flutter_firebase_getx/widget/app_circle_button.dart';
import 'package:flutter_firebase_getx/widget/content_area.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../services/firebase_storage_service.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionPaperController());
    Get.put(FirebaseStorageService());
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          menuBackgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width * 0.6,
          menuScreen: MenuScreen(),
          mainScreen: Container(
              //color: Colors.blue,
              decoration: BoxDecoration(gradient: mainGradient(context)),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          AppCircleButton(
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onTap: controller.toogleDrawer,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Whwt do you want to learn today")
                        ],
                      ),
                    ),
                    Expanded(
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                          () => ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return QuestionCard(
                                  model: _questionPaperController.allPapers[
                                      index]); // add-.imageUrl in catched

                              // ignore: dead_code
                              //             return ClipRRect(
                              //                 child: SizedBox(
                              //               height: 200,
                              //               width: 200,
                              //               // child: FadeInImage(
                              //               //     image:
                              //               //         // fadeimage- if we have big image
                              //               //         NetworkImage(
                              //               //             _questionPaperController.allPaperImages[index]),
                              //               //     // image: "dfghjk",
                              //               //     placeholder: const AssetImage("assets/images/order_food.jpg")
                              //               child: CachedNetworkImage(
                              //                   imageUrl: _questionPaperController.allPapers[index].imageUrl!,
                              //                   placeholder: (context, url) => Container(
                              //                         alignment: Alignment.center,
                              //                         child: const CircularProgressIndicator(),
                              //                       ),
                              //                   errorWidget: (context, url, error) =>
                              //                       Image.asset("assets/images/order_food.jpg") //
                              //                   //show no image available image on error loading

                              // //),
                              //                   //),
                              //                   ),
                              //             ));

                              // )
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                            // itemCount: _questionPaperController
                            //     .allPaperImages.length, // allPaperImages// allPapers-catched
                            itemCount:
                                _questionPaperController.allPapers.length, //
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      }),
    );
  }
}
