import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/res/textstyle.dart';

import '../../res/color.dart';
import '../../res/components/icon_button.dart';
import '../../view_model/quiz_view_model.dart';
import '../widgets/answer_tile.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Quiz Page',
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
        actions: [
          buttonExit(context),
        ],
      ),
      body: Column(
        children: [
          buildProgress(),
          const SizedBox(
            height: 15,
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            children: [
              buildQuestion("Wich month of the year?"),
              const SizedBox(
                height: 30,
              ),
              buildAnswers(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonExit(context) {
    return TextButton(
      onPressed: () {
        Navigator.restorablePushNamedAndRemoveUntil(
          context,
          '/',
          (route) => false,
        );
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(
            right: 30,
            top: 3,
          ),
          child: Text(
            'Exit',
            style: AppTextstyle.mainTextStyle.copyWith(
              fontWeight: AppTextstyle.light,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProgress() {
    return Consumer<QuizViewModel>(
      builder: (_, provider, ch) => LinearProgressBar(
        maxSteps: provider.countListQuestions,
        progressType:
            LinearProgressBar.progressTypeLinear, // Use Linear progress
        currentStep: provider.currentQuestionIndex + 1,
        progressColor: AppColors.kYellowColor,
        backgroundColor: AppColors.kLightPrimaryColor,
      ),
    );
  }

  Widget buildQuestion(String ques) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Consumer<QuizViewModel>(
        builder: (_, provider, ch) => Column(
          children: [
            Text(
              provider.listQuestions![provider.currentQuestionIndex].quest
                  .toString(),
              style: AppTextstyle.mainTextStyle.copyWith(
                fontWeight: AppTextstyle.black,
                color: AppColors.kBlackColor,
              ),
            ),
            provider.listQuestions![provider.currentQuestionIndex].image ==
                        null ||
                    provider.listQuestions![provider.currentQuestionIndex].image
                            .toString()
                            .trim() ==
                        ""
                ? const SizedBox()
                : provider.listQuestions![provider.currentQuestionIndex].image!
                        .contains("firebasestorage")
                    ? Image.network(
                        provider.listQuestions![provider.currentQuestionIndex]
                            .image!,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        provider.listQuestions![provider.currentQuestionIndex]
                            .image!,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
          ],
        ),
      ),
    );
  }

  Widget buildAnswers(context) {
    return Consumer<QuizViewModel>(
      builder: (_, provider, ch) => Column(
        children: provider
            .listQuestions![provider.currentQuestionIndex].answers!
            .map((answer) {
          return AnswerTile(
            title: answer.toString(),
            onPress: () async {
              if (kDebugMode) {
                print("Check Answer");
                print(answer.toString());
              }

              bool quizFinished = await provider.answerAdded(answer);
              if (quizFinished) {
                Navigator.pushNamed(
                  context,
                  '/result',
                );
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
