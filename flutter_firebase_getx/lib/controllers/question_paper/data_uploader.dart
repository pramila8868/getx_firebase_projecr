// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_getx/firebase_references/loading_status.dart';
import 'package:flutter_firebase_getx/firebase_references/references.dart';
import 'package:flutter_firebase_getx/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  //
  @override
  void onReady() {
    uploadData(); // this method use to upload data to birebase
    super.onReady();
  }

  final loadingStatus =
      LoadingStatus.loading.obs; // loadingstaus is obs (observable)

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0
    // ignore: unused_local_variable
    final firestore = FirebaseFirestore
        .instance; // create firestore instance because we want to sent the data to back end
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json"); // if we point out the image from ui
    // or controller you have tp pass Defaukt....
    final Map<String, dynamic> manifesMap =
        json.decode(manifestContent); // use for decode
    print("Data is uploaded");
    // load json file and print path
    //final paperInAssets = manifesMap.keys.where((path) => false);
    final paperInAssets = manifesMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    print(paperInAssets);

    // get the content from the above path
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in paperInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      // ignore: avoid_print
      print(stringPaperContent);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      // ignore: avoid_print
      print("Items number${questionPapers[0].id}");
    }
    //batch-multiple
    // batch operation where upload multiple data to the back end
    var batch = firestore.batch(); // firestore-instance
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id),
          // document-biology,chemistry and doc is an object
// paper.id is bilology id
          {
            "title": paper.tttle,
            "image_url": paper.imageUrl,
            "description": paper.description,
            "questions_count":
                paper.questions == null ? 0 : paper.questions!.length
          });

      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.questions,
          "correct_answer": questions.correctAnswe
        });

        for (var answer in questions.answers) {
          batch.set(questionPath.collection("answer").doc(answer.identifier),
              {"identifier": answer.identifier, "answer": answer.answer});
        }
      }

      await batch.commit(); // submmit everything in database
      loadingStatus.value = LoadingStatus.completed;
    }
  }
}
