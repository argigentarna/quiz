// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/view_model/question_view_model.dart';

import '../model/question.dart';

class QuizViewModel with ChangeNotifier {
  static List<QuestionModel>? _listQuestions = QuestionModel.getQuestionDummy();
  List<QuestionModel>? get listQuestions => _listQuestions;
  set listQuestions(List<QuestionModel>? val) {
    _listQuestions = val;
    notifyListeners();
  }

  List _listAnswer = [];
  List get listAnswer => _listAnswer;
  set listAnswer(List val) {
    _listAnswer = val;
    notifyListeners();
  }

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;
  set currentQuestionIndex(int index) {
    _currentQuestionIndex = index;
    notifyListeners();
  }

  Future<void> clearData() async {
    currentQuestionIndex = 0;
    listQuestions = null;
    listAnswer = [];
  }

  Future<bool> answerAdded(String value) async {
    _listAnswer.add(value);
    notifyListeners();

    if ((currentQuestionIndex + 1) == countListQuestions) {
      return true;
    }
    currentQuestionIndex = (currentQuestionIndex + 1);
    return false;
  }

  Future<void> generateQuizQuestion(
    String topic,
    context,
  ) async {
    QuestionViewModel providerQuestion = Provider.of<QuestionViewModel>(
      context,
      listen: false,
    );
    late List<QuestionModel>? _listQuestions = [];

    await clearData();

    _listQuestions = providerQuestion.listQuestionsByTopic(topic);
    _listQuestions?.shuffle();

    if (kDebugMode) {
      print("Generate Quiz");
      print(_listQuestions.toString());
      print(_listQuestions?.last.answers.toString());
      print(_listQuestions?.sublist(0, 5).length.toString());
    }

    listQuestions = _listQuestions?.sublist(0, 5);
  }

  String scoreQuiz() {
    int score = 0;
    for (var item in listQuestions!) {
      for (var answer in listAnswer) {
        if (item.trueAnswer.toString().trim() == answer.toString().trim()) {
          score = score + 1;
        }
      }
    }

    return "$score / $countListQuestions";
  }

  double percentageQuiz() {
    int score = 0;
    for (var item in listQuestions!) {
      for (var answer in listAnswer) {
        if (item.trueAnswer.toString().trim() == answer.toString().trim()) {
          score = score + 1;
        }
      }
    }

    if (kDebugMode) {
      print("Check percentage");
      print(score.toString());
      print((score / countListQuestions).toString());
    }

    return score / countListQuestions;
  }

  int get countListQuestions {
    return _listQuestions != null ? _listQuestions!.length : 0;
  }
}
