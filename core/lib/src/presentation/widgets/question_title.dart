import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';

class QuestionTitle extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? textSize;

  const QuestionTitle({
    super.key,
    required this.title,
    this.textColor,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor ?? AppColors.black,
        fontSize: textSize ?? AppFonts.sizeL,
        fontWeight: AppFonts.weightBold,
      ),
    );
  }
}
