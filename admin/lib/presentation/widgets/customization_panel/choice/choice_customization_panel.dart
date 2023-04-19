import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_buttons_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceCustomizationPanel extends StatelessWidget {
  // TODO(dev): to defines.
  final void Function(QuestionData data) onChange;
  final ChoiceQuestionData editable;

  const ChoiceCustomizationPanel({
    required this.onChange,
    required this.editable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        ChoiceCommonCustomizationTab(
          onChange: onChange,
          title: context.localization.common,
          editable: editable,
        ),
        ChoiceButtonsCustomizationTab(
          onChange: onChange,
          title: editable.isMultipleChoice
              ? context.localization.checkBox
              : context.localization.radioButton,
          editable: editable,
        ),
        ChoiceContentCustomizationTab(
          onChange: onChange,
          title: context.localization.content,
          editable: editable,
        ),
      ],
    );
  }
}

enum RuleType {
  none('None'),
  more('>'),
  less('<'),
  moreOrEqual('>='),
  lessOrEqual('<='),
  equal('=');

  const RuleType(
    this.name,
  );

  final String name;
}
