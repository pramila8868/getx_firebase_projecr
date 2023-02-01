//create firebase collection references
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance; // create instance of firestore

// questionPaperRF variable create questionPaper collection
final questionPaperRF =
    fireStore.collection("questionPaper"); // primary collection
final userRF = fireStore.collection("users");
DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);
Reference get firebaseStorage => FirebaseStorage.instance.ref();
