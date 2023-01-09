import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/res/color.dart';
import 'package:quiz_app/res/textstyle.dart';

class TopicTile extends StatelessWidget {
  final VoidCallback onPress;
  final String? title;

  const TopicTile({
    super.key,
    required this.onPress,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.kLightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title ?? "",
                style: AppTextstyle.mainTextStyle,
              ),
            ),
            const Icon(
              Icons.arrow_right,
              size: 35,
              color: AppColors.kWhiteColor,
            )
          ],
        ),
      ),
    );
  }
}
