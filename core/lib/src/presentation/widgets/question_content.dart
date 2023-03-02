import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({
    required this.content,
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: AppFonts.sizeS,
      ),
    );
  }
}
