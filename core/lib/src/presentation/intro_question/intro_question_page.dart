import 'package:core/src/presentation/utils/constants.dart';
import 'package:core/src/presentation/widgets/question_bottom_button.dart';
import 'package:core/src/presentation/widgets/question_content.dart';
import 'package:core/src/presentation/widgets/question_title.dart';
import 'package:flutter/material.dart';

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
          QuestionTitle(
            title: title,
          ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.margin2XL,
              ),
              child: QuestionContent(
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
                    isEnabled: true,
                  ),
                ),
              QuestionBottomButton(
                text: mainButtonTitle,
                onPressed: onMainButtonTap,
                isEnabled: true,
                isOutlined: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}