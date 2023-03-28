import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_buttons_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceCustomizationPanel extends StatefulWidget {
  // TODO(dev): to defines.
  final void Function(QuestionData data) onChange;
  final ChoiceQuestionData editable;

  const ChoiceCustomizationPanel({
    required this.onChange,
    required this.editable,
    super.key,
  });

  @override
  State<ChoiceCustomizationPanel> createState() =>
      _ChoiceCustomizationPanelState();
}

class _ChoiceCustomizationPanelState extends State<ChoiceCustomizationPanel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        ChoiceCommonCustomizationTab(
          onChange: widget.onChange,
          title: context.localization.common,
          editable: widget.editable,
        ),
        ChoiceButtonsCustomizationTab(
          onChange: widget.onChange,
          title: widget.editable.isMultipleChoice
              ? context.localization.check_box
              : context.localization.radio_button,
          editable: widget.editable,
        ),
        ChoiceContentCustomizationTab(
          onChange: widget.onChange,
          // TODO(dev): do we need this?
          key: UniqueKey(),
          title: context.localization.content,
          editable: widget.editable,
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
