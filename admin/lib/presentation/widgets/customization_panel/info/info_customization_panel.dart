import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/info/info_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/info/info_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_sdk/survey_sdk.dart';

class InfoCustomizationPanel extends StatelessWidget {
  final ValueChanged<QuestionData> onChange;
  final InfoQuestionData editable;
  final int? questionsAmount;

  const InfoCustomizationPanel({
    required this.onChange,
    required this.editable,
    required this.questionsAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        InfoContentCustomizationTab(
          onChange: onChange,
          title: context.localization.content,
          editable: editable,
          questionsAmount: questionsAmount,
        ),
        InfoCommonCustomizationTab(
          onChange: onChange,
          title: context.localization.common,
          editable: editable,
        ),
      ],
    );
  }
}
