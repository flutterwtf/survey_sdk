import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/widgets/question_content.dart';
import 'package:survey_sdk/src/presentation/widgets/question_title.dart';
import 'package:survey_sdk/survey_sdk.dart';

class InfoDataView extends StatelessWidget {
  final InfoQuestionData data;

  const InfoDataView({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme =
        data.theme ?? Theme.of(context).extension<InfoQuestionTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (data.title.isNotEmpty)
          QuestionTitle(
            title: data.title,
            textColor: theme.titleColor,
            textSize: theme.titleSize,
          ),
        if (data.subtitle.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: SurveyDimensions.marginS,
            ),
            child: QuestionContent(
              content: data.subtitle,
              textColor: theme.subtitleColor,
              textSize: theme.subtitleSize,
            ),
          ),
      ],
    );
  }
}
