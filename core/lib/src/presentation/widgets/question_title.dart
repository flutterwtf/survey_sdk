import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_text_styles.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.karlaLBold,
    );
  }
}
