import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/question_data_transformers.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_buttons_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceCustomizationPanel extends StatefulWidget {
  // TODO(dev): may be we can find a better name?
  final ChoiceQuestionTransformers transformers;
  final QuestionData editableQuestion;
  final bool isMultipleChoice;

  const ChoiceCustomizationPanel({
    required this.transformers,
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
          onFillColorPicked: widget.transformers.updateFillColor,
          onTitleColorPicked: widget.transformers.updateTitleColor,
          onTitleFontSizeChanged: widget.transformers.updateTitleFontSize,
          onSubtitleColorPicked: widget.transformers.updateSubtitleColor,
          onSubtitleFontSizeChanged: widget.transformers.updateSubtitleFontSize,
          onButtonColorPicked: widget.transformers.updateButtonColor,
          onButtonFontSizeChanged: widget.transformers.updateButtonFontSize,
          onButtonRadiusChanged: widget.transformers.updateButtonRadius,
        ),
        ChoiceButtonsCustomizationTab(
          title: widget.isMultipleChoice
              ? context.localization.check_box
              : context.localization.radio_button,
          onMultipleChoiceUpdate: (isMultipleChoice) {},
          onActiveColorPicked: widget.transformers.updateActiveColor,
          onInactiveColorPicked: widget.transformers.updateInactiveColor,
        ),
        ChoiceContentCustomizationTab(
          key: UniqueKey(),
          title: context.localization.content,
          onTitleChanged: widget.transformers.updateTitle,
          onSubTitleChanged: widget.transformers.updateSubtitle,
          onOptionsChanged: (options) {
            widget.transformers.updateOptions(options);
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
