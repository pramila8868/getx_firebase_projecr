import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_getx/controllers/auth_controller.dart';
import 'package:flutter_firebase_getx/firebase_references/references.dart';
import 'package:flutter_firebase_getx/models/question_paper_model.dart';
import 'package:flutter_firebase_getx/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  // ignore: unnecessary_overrides
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // not returning anything so use future void
    // List<String> imgName = [
    List<String> imgName = [
      // imgName is papername
      // "biology",
      // "chemistry",
      // "maths",
      // "physics"
      "address",
      "address3",
      "glocery",
      "order_food"
    ]; // paper name
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      // by using questionpaperref colection get everything from firebase storage and save it into data // objname of data or objecttype of firebase
      final paperList = data.docs // paperList // this is coming form firebase//
          .map((paper) => QuestionPaperModel.fromsnapshot(paper))
          .toList();
      allPapers.assignAll(paperList); //paperList
      for (var paper in paperList) {
        //paperList
        // imgName-paperList
        // paper-img
        final imgUrl = await Get.find<FirebaseStorageService>()
            .getImage(paper.tttle); // paper-img
        //  allPaperImages.add(imgUrl!);
        paper.imageUrl = imgUrl;
        print(imgUrl);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }
//     try {
//       for (var img in imgName) {
//         // imgName-paperList
//         // paper-img
//         final imgUrl =
//             await Get.find<FirebaseStorageService>().getImage(img); // paper-img
//         allPaperImages.add(imgUrl!);
// //paper.imageUrl = imgUrl;
//       }
//       // allPapers.assignAll(paperList);
//     } catch (e) {
//       print(e);
//     }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back(); // get.offNamed
      } else {
        //Get.toNamed();
        print("Logged in");
      }
    } else {
      print("The title is${paper.tttle}");
      _authController.showLoginAlertDialogue();
    }
  }
}
