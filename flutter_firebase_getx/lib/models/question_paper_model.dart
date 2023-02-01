//  bilogy.json is nested map

import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String id;
  String tttle;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;
  int questionCount;

  QuestionPaperModel(
      {required this.id,
      required this.tttle,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questionCount,
      this.questions});
  // create method that takes jason
  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        tttle = json['tttle'] as String,
        imageUrl = json['image_url'] as String,
        description = json['Description'] as String,
        timeSeconds = json['time_seconds'],
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  //}

  // ignore: non_constant_identifier_names
  QuestionPaperModel.fromsnapshot(
      DocumentSnapshot<Map<String, dynamic>>
          json) // data come from firebase so call snapshot
      : id = json.id,
        tttle = json['tttle'],
        imageUrl = json['image_url'],
        description = json['Description'],
        timeSeconds = json['time_seconds'],
        questionCount = json["question_count"] as int,
        questions = [];
  String timeInMinutes() => '${(timeSeconds / 60).ceil()}mins';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tttle'] = this.tttle;
    data['image_url'] = this.imageUrl;
    data['Description'] = this.description;
    data['time_seconds'] = this.timeSeconds;
    // if (this.questions != null) {
    //   data['questions'] = this.questions.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Questions {
  String id;
  String questions;
  List<Answers> answers;
  String? correctAnswe;

  Questions(
      {required this.id,
      required this.questions,
      required this.answers,
      this.correctAnswe});

  Questions.fromJson(Map<String, dynamic> json)
      : //{
        id = json['id'], //;
        questions = json['questions'], //;
        answers = (json['answers'] as List)
            .map((e) => Answers.fromJson(e))
            .toList(), //;
        //if (json['answers'] != null) {
        //answers = new List<Answers>();
        // json['answers'].forEach((v) {
        //   answers.add(new Answers.fromJson(v));
        // });
        // }
        correctAnswe = json['correct_answe'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questions'] = this.questions;
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    data['correct_answe'] = this.correctAnswe;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['Answer'] = this.answer;
    return data;
  }
}
