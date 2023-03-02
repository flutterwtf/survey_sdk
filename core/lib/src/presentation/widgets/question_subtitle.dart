import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_text_styles.dart';

class QuestionSubtitle extends StatelessWidget {
  final String content;

  const QuestionSubtitle({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: AppTextStyles.karlaSBlack,
    );
  }
}
