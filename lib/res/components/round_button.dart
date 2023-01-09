// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:quiz_app/res/textstyle.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kButtonColor,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColors.kWhiteColor,
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: AppColors.kWhiteColor,
                    fontSize: 15,
                    fontWeight: AppTextstyle.semiBold,
                  ),
                ),
        ),
      ),
    );
  }
}
