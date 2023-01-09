import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/res/color.dart';
import 'package:quiz_app/res/textstyle.dart';

class IconCustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final bool loading;
  final String? title;
  final Icon icon;
  final EdgeInsetsGeometry? margin;

  const IconCustomButton({
    Key? key,
    this.title,
    this.loading = false,
    this.margin,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: margin,
        color: AppColors.kTransparent,
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Container(
              child: icon,
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              margin: const EdgeInsets.only(top: 1),
              child: Text(
                title ?? '',
                style: AppTextstyle.mainTextStyle,
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
