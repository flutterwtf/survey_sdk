import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/intro_question_theme.dart';
import 'package:survey_core/src/presentation/localization/app_localizations_ext.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

/// The question page with a question, question description, and buttons
class IntroQuestionPage extends StatefulWidget {
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

  @override
  State<IntroQuestionPage> createState() => _IntroQuestionPageState();
}

class _IntroQuestionPageState extends State<IntroQuestionPage> {
  @override
  Widget build(BuildContext context) {
    final theme =
        widget.data.theme ?? Theme.of(context).extension<IntroQuestionTheme>()!;
    final onSecondaryButtonTap = widget.onSecondaryButtonTap;
    final content = widget.data.subtitle;
    return Scaffold(
      backgroundColor: theme.fill,
      body: Padding(
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
              title: widget.data.title,
              textColor: theme.titleColor,
              textSize: theme.titleSize,
            ),
            if (content != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimensions.margin2XL,
                ),
                child: QuestionContent(
                  content: content,
                  textColor: theme.subtitleColor,
                  textSize: theme.subtitleSize,
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
                    text: widget.data.buttonText,
                    color: theme.buttonFill,
                    textColor: theme.buttonTextColor,
                    textSize: theme.buttonTextSize,
                    radius: theme.buttonRadius,
                    onPressed: widget.onMainButtonTap ?? () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
