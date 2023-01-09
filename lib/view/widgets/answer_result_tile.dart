import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/res/color.dart';
import 'package:quiz_app/res/components/icon_button.dart';
import 'package:quiz_app/res/textstyle.dart';

class AnswerResultTile extends StatelessWidget {
  final String question;
  final String answer;
  final String trueAnswer;

  const AnswerResultTile({
    super.key,
    required this.question,
    required this.answer,
    required this.trueAnswer,
  });

  bool answerIsTrue() {
    if (answer == trueAnswer) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          question,
          style: AppTextstyle.mainTextStyle,
        ),
        Wrap(
          direction: Axis.horizontal,
          children: [
            IconCustomButton(
              title: answer,
              icon: Icon(
                answerIsTrue() ? Icons.check : Icons.close,
                color: answerIsTrue()
                    ? AppColors.kGreenColor
                    : AppColors.kRedColor,
              ),
              onPress: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            answerIsTrue()
                ? const SizedBox()
                : IconCustomButton(
                    title: trueAnswer,
                    icon: const Icon(
                      Icons.check,
                      color: AppColors.kGreenColor,
                    ),
                    onPress: () {},
                  ),
          ],
        ),
      ],
    );
  }
}
