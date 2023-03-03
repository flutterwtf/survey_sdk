import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/theme_extension.dart';

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
      style: context.theme.textTheme.bodySmall,
    );
  }
}
