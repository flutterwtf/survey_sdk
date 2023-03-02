import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';
import 'package:flutter/material.dart';

import 'package:survey_core/src/domain/entities/themes/intro_question_theme.dart';

class IntroQuestionPage extends StatelessWidget {
  final IntroQuestionData data;
  final OnSendCallback onSend;
  final VoidCallback? onMainButtonTap;
  //TODO: onSkip
  final VoidCallback? onSecondaryButtonTap;

  const IntroQuestionPage({
    required this.data,
    required this.onSend,
    this.onMainButtonTap,
    this.onSecondaryButtonTap,
    super.key,
  });

  IntroQuestionTheme get _theme =>
      data.theme ?? const IntroQuestionTheme.common();

  @override
  Widget build(BuildContext context) {
    final onSecondaryButtonTap = this.onSecondaryButtonTap;
    final content = data.content;
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.margin2XL,
        right: AppDimensions.margin2XL,
        top: AppDimensions.margin3XL,
        bottom: AppDimensions.marginXL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionTitle(
            title: data.title,
            textColor: _theme.titleTextColor,
            textSize: _theme.titleTextSize,
          ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.margin2XL,
              ),
              child: QuestionContent(
                content: content,
                textColor: _theme.subTitleTextColor,
                textSize: _theme.subTitleTextSize,
              ),
            ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (onSecondaryButtonTap != null)
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: QuestionBottomButton(
                      text: context.localization.skip,
                      onPressed: onSecondaryButtonTap,
                      isEnabled: true,
                    ),
                  ),
                ),
              Flexible(
                fit: FlexFit.loose,
                child: QuestionBottomButton(
                  text: data.mainButtonTitle,
                  color: _theme.mainButtonColor,
                  textColor: _theme.mainButtonTextColor,
                  textSize: _theme.mainButtonTextSize,
                  radius: _theme.mainButtonRadius,
                  onPressed: onMainButtonTap ?? () {},
                  isEnabled: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
