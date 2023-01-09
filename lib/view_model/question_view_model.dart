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

  Future<void> fetchQuestionsDummy() async {
    // List<QuestionModel> list = QuestionModel.getQuestionDummy();
    // if (kDebugMode) {
    //   print("Check List");
    //   print(list.toString());
    // }
    // listQuestions = list;
  }
}
