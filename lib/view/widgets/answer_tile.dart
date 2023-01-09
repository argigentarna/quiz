import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../res/color.dart';
import '../../res/textstyle.dart';

class AnswerTile extends StatelessWidget {
  final VoidCallback onPress;
  final String? title;

  const AnswerTile({
    super.key,
    required this.onPress,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title ?? "",
            style: AppTextstyle.mainTextStyle.copyWith(
              color: AppColors.kBlackColor,
              fontWeight: AppTextstyle.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
