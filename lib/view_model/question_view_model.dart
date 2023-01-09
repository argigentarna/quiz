// ignore_for_file: avoid_function_literals_in_foreach_calls, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";

import '../model/question.dart';

class QuestionViewModel with ChangeNotifier {
  static List<QuestionModel>? _listQuestions = QuestionModel.getQuestionDummy();
  List<QuestionModel>? get listQuestions => _listQuestions;
  set listQuestions(List<QuestionModel>? val) {
    _listQuestions = val;
    notifyListeners();
  }

  Iterable<String?> get listTopicQuestion =>
      groupBy(_listQuestions!, (quest) => quest.topic).keys;

  List<QuestionModel>? listQuestionsByTopic(String topic) {
    if (topic == "") {
      return listQuestions;
    }

    return listQuestions
        ?.where((questions) => questions.topic == topic)
        .toList();
  }

  int get countListQuestions {
    return _listQuestions != null ? _listQuestions!.length : 0;
  }

  Future<void> fetchQuestionsFromFirestore() async {
    // NOTE : Get data from firestore
    List<QuestionModel> _question = [];

    await FirebaseFirestore.instance
        .collection('question')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _question.add(
          QuestionModel(
            quest: doc['quest'],
            image: doc['image'] ?? "",
            answers: doc['answers'].cast<String>()?.toList(),
            topic: doc['topic'],
            trueAnswer: doc['trueAnswer'],
          ),
        );
      });
    });

    listQuestions = _question;
  }
}
