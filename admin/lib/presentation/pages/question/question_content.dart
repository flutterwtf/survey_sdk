import 'package:flutter/material.dart';

import '../../utils/app_fonts.dart';

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
      ),
    );
  }
}
