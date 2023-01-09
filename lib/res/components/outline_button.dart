import 'package:flutter/material.dart';
import 'package:quiz_app/res/textstyle.dart';

import '../color.dart';

class OutlineCustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const OutlineCustomButton({
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
          borderRadius: BorderRadius.circular(
            30,
          ),
          border: Border.all(
            color: AppColors.kButtonColor,
            width: 2,
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
                    color: AppColors.kButtonColor,
                    fontSize: 15,
                    fontWeight: AppTextstyle.semiBold,
                  ),
                ),
        ),
      ),
    );
  }
}
