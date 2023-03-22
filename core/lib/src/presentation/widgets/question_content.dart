import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';

class QuestionContent extends StatelessWidget {
  final String content;
  final Color? textColor;
  final double? textSize;

  const QuestionContent({
    required this.content,
    this.textColor,
    this.textSize,
    super.key,
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
