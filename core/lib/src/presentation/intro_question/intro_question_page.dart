import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/intro_question_theme.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';
import 'package:survey_sdk/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_sdk/src/presentation/widgets/question_content.dart';
import 'package:survey_sdk/src/presentation/widgets/question_title.dart';

/// The question page for displaying intro content.
///
/// The [IntroQuestionPage] widget is used to display introductory content to
/// the user. It can contain a title, subtitle, and buttons for navigation.
class IntroQuestionPage extends StatefulWidget {
  /// Contains the content for a page
  final IntroQuestionData data;

  /// Callback that is called after pressing bottom button.
  final OnSendCallback onSend;

  /// Optional callback that is called after pressing main button.
  final VoidCallback? onMainButtonTap;

  // TODO(dev): onSkip.
  /// Optional callback that is called when the secondary button is tapped.
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
    return Scaffold(
      backgroundColor: theme.fill,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppDimensions.margin2XL,
                right: AppDimensions.margin2XL,
                top: AppDimensions.margin3XL,
                bottom: AppDimensions.marginXL,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.data.title.isNotEmpty)
                    QuestionTitle(
                      title: widget.data.title,
                      textColor: theme.titleColor,
                      textSize: theme.titleSize,
                    ),
                  if (widget.data.subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimensions.marginS,
                      ),
                      child: QuestionContent(
                        content: widget.data.subtitle,
                        textColor: theme.subtitleColor,
                        textSize: theme.subtitleSize,
                      ),
                    ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.marginS),
                    child: Row(
                      children: [
                        if (widget.data.isSkip)
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: QuestionBottomButton(
                                text: widget.data.secondaryButtonText,
                                color: theme.secondaryButtonFill,
                                textColor: theme.secondaryButtonTextColor,
                                textSize: theme.secondaryButtonTextSize,
                                radius: theme.secondaryButtonRadius,
                                onPressed: widget.onSecondaryButtonTap,
                              ),
                            ),
                          ),
                        Flexible(
                          child: QuestionBottomButton(
                            text: widget.data.primaryButtonText,
                            color: theme.primaryButtonFill,
                            textColor: theme.primaryButtonTextColor,
                            textSize: theme.primaryButtonTextSize,
                            radius: theme.primaryButtonRadius,
                            onPressed: widget.onMainButtonTap,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
