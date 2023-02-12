import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';

class QuestionTitle extends StatelessWidget {
  final String title;

  const QuestionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeL,
      ),
    );
  }
}
