import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/question_types/info_question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/info_question_theme.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';
import 'package:survey_sdk/src/presentation/widgets/question_content.dart';
import 'package:survey_sdk/src/presentation/widgets/question_title.dart';

/// The question page for displaying intro content.
///
/// The [FinalPage] widget is used to display introductory content to
/// the user. It can contain a title, subtitle, and buttons for navigation.
class FinalPage extends StatefulWidget {
  /// Contains the content for a page.
  final InfoQuestionData data;

  const FinalPage({
    required this.data,
    super.key,
  });

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    final theme =
        widget.data.theme ?? Theme.of(context).extension<InfoQuestionTheme>()!;
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
