import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/res/shared/shared_methods.dart';
import 'package:quiz_app/res/textstyle.dart';

import '../../res/color.dart';
import '../../res/components/icon_button.dart';
import '../../view_model/quiz_view_model.dart';
import '../widgets/answer_result_tile.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  void goHome(context) {
    Navigator.restorablePushNamedAndRemoveUntil(
      context,
      '/',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        goHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: const Text(
            'Your Score',
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconCustomButton(
            margin: const EdgeInsets.only(
              left: 20,
              top: 17,
            ),
            title: '',
            onPress: () {
              goHome(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: [
            const SizedBox(
              height: 30,
            ),
            Consumer<QuizViewModel>(
              builder: (_, provider, ch) => CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 5.0,
                percent: provider.percentageQuiz(),
                center: Text(
                  provider.scoreQuiz().toString(),
                  style: AppTextstyle.mainTextStyle,
                ),
                progressColor: AppColors.kGreenColor,
                backgroundColor: AppColors.kRedColor,
                rotateLinearGradient: false,
              ),
            ),
            buildShareScore(),
            const SizedBox(
              height: 30,
            ),
            buildListAnswer(),
          ],
        ),
      ),
    );
  }

  Widget buildShareScore() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Consumer<QuizViewModel>(
          builder: (_, provider, ch) => ElevatedButton(
            onPressed: () {
              SharedMethods.share(
                'I got score ${provider.scoreQuiz()} from Flutter Quiz App',
              );
            },
            child: Text(
              'share your score',
              style: AppTextstyle.mainTextStyle,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Your Report',
          style: AppTextstyle.mainTextStyle.copyWith(
            fontSize: 18,
            fontWeight: AppTextstyle.bold,
          ),
        )
      ],
    );
  }

  Widget buildListAnswer() {
    return Consumer<QuizViewModel>(
      builder: (_, provider, ch) => ListView.builder(
        shrinkWrap: true,
        itemCount: provider.countListQuestions,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return AnswerResultTile(
            question: provider.listQuestions![index].quest.toString(),
            answer: provider.listAnswer[index],
            trueAnswer: provider.listQuestions![index].trueAnswer.toString(),
          );
        },
      ),
    );
  }
}
