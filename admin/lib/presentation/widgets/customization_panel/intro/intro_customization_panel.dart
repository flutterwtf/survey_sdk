import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

class IntroCustomizationPanel extends StatelessWidget {
  final void Function(QuestionData data) onChange;
  final IntroQuestionData editable;

  const IntroCustomizationPanel({
    required this.onChange,
    required this.editable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        IntroCommonCustomizationTab(
          onChange: onChange,
          // TODO(dev): We can remove title property probably.
          title: context.localization.common,
          editable: editable,
        ),
        IntroContentCustomizationTab(
          onChange: onChange,
          title: context.localization.content,
          editable: editable,
        ),
      ],
    );
  }
}
