import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/theme_extension.dart';

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
      style: context.theme.textTheme.titleSmall,
    );
  }
}
