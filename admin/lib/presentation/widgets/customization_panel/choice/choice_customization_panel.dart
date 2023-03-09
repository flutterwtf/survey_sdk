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

  const ChoiceCustomizationPanel({
    required this.editableQuestion,
    super.key,
  });

  @override
  State<ChoiceCustomizationPanel> createState() =>
      _ChoiceCustomizationPanelState();
}

class _ChoiceCustomizationPanelState extends State<ChoiceCustomizationPanel> {
  RuleType ruleType = RuleType.none;
  List<String> listOptions = [];
  int limitedRule = 0;

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
          title: context.localization.radio_button,
          onActiveColorPicked: (activeColor) {},
          onInactiveColorPicked: (inactiveColor) {},
        ),
        ChoiceContentCustomizationTab(
          key: UniqueKey(),
          title: context.localization.content,
          onTitleChanged: (title) {},
          onSubTitleChanged: (subtitle) {},
          onOptionsChanged: (options) {
            setState(() {
              listOptions = options;
            });
          },
          onRuleChanged: (value) {
            setState(() {
              ruleType = value;
            });
          },
          onRuleLimitedChanged: (value) {
            setState(() {
              limitedRule = value;
            });
          },
          ruleType: ruleType,
          limitedRule: limitedRule,
          listOptions: listOptions,
          editableQuestion: widget.editableQuestion,
        ),
      ],
    );
  }
}
