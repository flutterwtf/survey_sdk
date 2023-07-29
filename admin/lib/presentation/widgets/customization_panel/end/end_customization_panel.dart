import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/end/end_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/end/end_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_sdk/survey_sdk.dart';

class EndCustomizationPanel extends StatelessWidget {
  final ValueChanged<QuestionData> onChange;
  final EndQuestionData editable;
  final int questionsAmount;

  const EndCustomizationPanel({
    required this.onChange,
    required this.editable,
    required this.questionsAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        EndContentCustomizationTab(
          onChange: onChange,
          title: context.localization.content,
          editable: editable,
          questionsAmount: questionsAmount,
        ),
        EndCommonCustomizationTab(
          onChange: onChange,
          title: context.localization.common,
          editable: editable,
        ),
      ],
    );
  }
}
