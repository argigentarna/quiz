// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/res/textstyle.dart';

import '../../res/color.dart';
import '../../res/components/icon_button.dart';
import '../../view_model/question_view_model.dart';
import '../../view_model/quiz_view_model.dart';
import '../widgets/topic_tile.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Topics',
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconCustomButton(
          margin: const EdgeInsets.only(
            left: 20,
            top: 18,
          ),
          title: '',
          onPress: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Consumer<QuestionViewModel>(
        builder: (_, provider, ch) => ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          children: provider.listTopicQuestion.map((topic) {
            return TopicTile(
              onPress: () async {
                if (kDebugMode) {
                  print("Check Topic");
                  print(topic.toString());
                }
                QuizViewModel provQuiz = Provider.of<QuizViewModel>(
                  context,
                  listen: false,
                );

                await provQuiz.generateQuizQuestion(
                  topic.toString(),
                  context,
                );

                Navigator.pushNamed(
                  context,
                  '/quiz',
                );
              },
              title: topic,
            );
          }).toList(),
        ),
      ),
    );
  }
}
