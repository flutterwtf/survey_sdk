import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_buttons_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

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

class ChoiceCustomizationPanel extends StatefulWidget {
  final QuestionData editableQuestion;
  final bool isMultipleChoice;

  const ChoiceCustomizationPanel({
    required this.editableQuestion,
    required this.isMultipleChoice,
    super.key,
  });

  @override
  State<ChoiceCustomizationPanel> createState() =>
      _ChoiceCustomizationPanelState();
}

class _ChoiceCustomizationPanelState extends State<ChoiceCustomizationPanel> {
  RuleType _ruleType = RuleType.none;
  List<String> _listOptions = [];
  int _ruleValue = 0;

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        ChoiceCommonCustomizationTab(
          title: context.localization.common,
          onFillColorPicked: (fillColor) {},
          onTitleColorPicked: (titleColor) {},
          onTitleFontSizeChanged: (titleFontSize) {},
          onSubtitleColorPicked: (subtitleColor) {},
          onSubtitleFontSizeChanged: (subtitleFontSize) {},
          onButtonColorPicked: (buttonColor) {},
          onButtonTextColorPicked: (buttonTextColor) {},
          onButtonFontSizeChanged: (buttonFontSize) {},
          onButtonRadiusChanged: (buttonRadius) {},
        ),
        ChoiceButtonsCustomizationTab(
          title: widget.isMultipleChoice
              ? context.localization.check_box
              : context.localization.radio_button,
          onMultipleChoiceUpdate: (isMultipleChoice) {},
          onActiveColorPicked: (activeColor) {},
          onInactiveColorPicked: (inactiveColor) {},
        ),
        ChoiceContentCustomizationTab(
          key: UniqueKey(),
          title: context.localization.content,
          onTitleChanged: (title) {},
          onSubTitleChanged: (subtitle) {},
          onOptionsChanged: (options) {
            setState(() => _listOptions = options);
          },
          onRuleChanged: (value) {
            setState(() => _ruleType = value);
          },
          onRuleLimitedChanged: (value) {
            setState(() => _ruleValue = value);
          },
          ruleType: _ruleType,
          ruleValue: _ruleValue,
          listOptions: _listOptions,
          editableQuestion: widget.editableQuestion,
        ),
      ],
    );
  }
}
