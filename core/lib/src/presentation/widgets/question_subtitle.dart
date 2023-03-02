import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';

class QuestionSubtitle extends StatelessWidget {
  final String content;

  const QuestionSubtitle({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: AppFonts.sizeS,
        color: Colors.black,
      ),
    );
  }
}
