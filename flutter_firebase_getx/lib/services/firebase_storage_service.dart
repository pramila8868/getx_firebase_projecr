import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase_getx/firebase_references/references.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService {
  // Reference get firebaseStorage => FirebaseStorage.instance.ref();

  //GetxController {
  Future<String?> getImage(String? imgName) async {
    // get the image from firebase
    if (imgName == null) {
      return null;
    }

    try {
      var urlRef = firebaseStorage
          .child("question_paper_images") // folder name of firebase
          .child("${imgName.toLowerCase()}.jpg"); // image name
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
