import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/intro_question_theme.dart';
import 'package:survey_core/src/presentation/localization/app_localizations_ext.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

/// The question page with a question, question description, and buttons
class IntroQuestionPage extends StatelessWidget {
  /// Contains the content for a page
  final IntroQuestionData data;

  final OnSendCallback onSend;

  /// Optional callback that is called after pressing main button
  final VoidCallback? onMainButtonTap;

  // TODO(dev): onSkip.
  /// Optional callback that is called after pressing main button
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
            children: [
              if (onSecondaryButtonTap != null)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: QuestionBottomButton(
                      text: context.localization.skip,
                      onPressed: onSecondaryButtonTap,
                    ),
                  ),
                ),
              Flexible(
                child: QuestionBottomButton(
                  text: data.mainButtonTitle,
                  color: _theme.mainButtonColor,
                  textColor: _theme.mainButtonTextColor,
                  textSize: _theme.mainButtonTextSize,
                  radius: _theme.mainButtonRadius,
                  onPressed: onMainButtonTap ?? () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
