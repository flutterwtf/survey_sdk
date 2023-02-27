import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';

class QuestionContent extends StatelessWidget {
  final String content;
  final Color? textColor;
  final double? textSize;

  const QuestionContent({
    super.key,
    required this.content,
    this.textColor,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: textColor ?? AppColors.black,
        fontSize: textSize ?? AppFonts.sizeS,
      ),
    );
  }
}
