//import 'package:cached_network_image/cached_network_image.dart';
// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/custom_text_styles.dart';
import 'package:flutter_firebase_getx/config/themes/ui_parameter.dart';
import 'package:flutter_firebase_getx/controllers/question_paper_controller.dart';
import 'package:flutter_firebase_getx/models/question_paper_model.dart';
import 'package:flutter_firebase_getx/widget/app_icon_text.dart';
import 'package:get/get.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({Key? key, required this.model}) : super(key: key);
  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: Theme.of(context).cardColor),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(paper: model);
          // print("${model.tttle}");
        },
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      // container replaced with colorbox beacuse colorsbox has less property it makes running (complie) fast
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: SizedBox(
                        height: Get.width * 0.15,
                        width: Get.width * 0.15,
                        //               child: FadeInImage(
                        //                   image:
                        //                       // fadeimage- if we have big image
                        //                       NetworkImage(
                        //                           _questionPaperController.allPaperImages[index]),
                        //                   // image: "dfghjk",
                        //                   placeholder: const AssetImage("assets/images/order_food.jpg")
                        child: CachedNetworkImage(
                            imageUrl: model.imageUrl!,
                            // imageUrl: _questionPaperController.allPapers[index].imageUrl!,
                            placeholder: (context, url) => Container(
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                ),
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/images/order_food.jpg") //
                            //show no image available image on error loading

                            ),
                      ),
                    ),
                    //                   ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.tttle,
                        style: cartTitles(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(model.description),
                      ),
                      Row(
                        children: [
                          AppIconText(
                              icon: Icon(
                                Icons.help_outline_sharp,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.3),
                              ),
                              text: Text(
                                "${model.questionCount}questions",
                                style: detailText.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          AppIconText(
                              icon: Icon(
                                Icons.timer,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.3),
                              ),
                              text: Text(
                                model.timeInMinutes(),
                                // "${model.questionCount}questions",
                                style: detailText.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                              ))
                        ],
                      ),
                      Positioned(
                          bottom: -_padding,
                          right: -_padding,
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              // ignore: sort_child_properties_last
                              child: Icon(
                                Icons.wine_bar,
                                color: Colors.red,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(cardBorderRadius),
                                      bottomRight:
                                          Radius.circular(cardBorderRadius)),
                                  color: Theme.of(context).primaryColor),
                            ),
                          ))
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
