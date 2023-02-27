import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

class IntroQuestionPage extends StatelessWidget {
  final IntroQuestionData data;
  final OnSendCallback onSend;
  final VoidCallback? onMainButtonTap;
  final VoidCallback? onSecondaryButtonTap;

  const IntroQuestionPage({
    required this.data,
    required this.onSend,
    this.onMainButtonTap,
    this.onSecondaryButtonTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onSecondaryButtonTap = this.onSecondaryButtonTap;
    final secondaryButtonTitle = data.secondaryButtonTitle;
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
          ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.margin2XL,
              ),
              child: QuestionContent(
                content: content,
              ),
            ),
          const Spacer(),
          Row(
            children: [
              if (onSecondaryButtonTap != null && secondaryButtonTitle != null)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: QuestionBottomButton(
                      text: secondaryButtonTitle,
                      onPressed: onSecondaryButtonTap,
                      isOutlined: true,
                    ),
                  ),
                ),
              Flexible(
                child: QuestionBottomButton(
                  text: data.mainButtonTitle,
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
