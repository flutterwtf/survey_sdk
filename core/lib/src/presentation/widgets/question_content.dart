import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';

/// Represents the content of a survey question.
class QuestionContent extends StatelessWidget {
  /// Text content of the question.
  final String content;

  /// Text color of the question content.
  final Color? textColor;

  /// Font size of the question content.
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
        color: textColor ?? SurveyColors.black,
        fontSize: textSize ?? SurveyFonts.sizeS,
      ),
    );
  }
}
