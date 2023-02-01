import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_getx/controllers/question_paper/data_uploader.dart';
import 'package:flutter_firebase_getx/firebase_references/loading_status.dart';
import 'package:get/get.dart';

class DataUploadScreen extends StatelessWidget {
  DataUploadScreen({Key? key}) : super(key: key);
  DataUploader controller =
      Get.put(DataUploader()); // this way controller will injected
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Obx(() => Text(controller.loadingStatus.value == LoadingStatus.completed
            ? "Uploading Completed"
            : "uploading")),
      ]),
    );
  }
}
