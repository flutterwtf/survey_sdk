import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({
    required this.title,
    super.key,
  });

  final String title;

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
