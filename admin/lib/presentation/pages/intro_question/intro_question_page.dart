import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';
import 'package:survey_sdk/presentation/widgets/question_bottom_button.dart';

class IntroQuestionPage extends StatelessWidget {
  final String title;
  final String? content;
  final VoidCallback onMainButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final String mainButtonTitle;
  final String? secondaryButtonTitle;

  const IntroQuestionPage({
    required this.title,
    required this.onMainButtonTap,
    required this.mainButtonTitle,
    this.secondaryButtonTitle,
    this.onSecondaryButtonTap,
    this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          _QuestionTitle(
            title: title,
          ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.margin2XL,
              ),
              child: _QuestionTextContent(
                content: content!,
              ),
            ),
          const Spacer(),
          Row(
            children: [
              if (onSecondaryButtonTap != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: QuestionBottomButton(
                    text: secondaryButtonTitle!,
                    onPressed: onSecondaryButtonTap!,
                    isMain: false,
                    isEnabled: true,
                  ),
                ),
              QuestionBottomButton(
                text: mainButtonTitle,
                onPressed: onMainButtonTap,
                isEnabled: true,
                isMain: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuestionTitle extends StatelessWidget {
  const _QuestionTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeL,
      ),
    );
  }
}

class _QuestionTextContent extends StatelessWidget {
  const _QuestionTextContent({
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
