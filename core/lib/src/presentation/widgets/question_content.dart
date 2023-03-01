import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: AppFonts.sizeS,
        fontFamily: AppFonts.karlaFamily,
        fontWeight: AppFonts.weightRegular,
        color: Colors.black,
      ),
    );
  }
}
