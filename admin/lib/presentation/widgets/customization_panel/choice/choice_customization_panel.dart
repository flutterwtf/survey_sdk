import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_buttons_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceCustomizationPanel extends StatefulWidget {
  const ChoiceCustomizationPanel({
    super.key,
  });

  @override
  State<ChoiceCustomizationPanel> createState() =>
      _ChoiceCustomizationPanelState();
}

class _ChoiceCustomizationPanelState extends State<ChoiceCustomizationPanel> {
  late final ChoiceQuestionData _data;

  @override
  void initState() {
    // TODO(dev): Rechek.
    final state = BlocProvider.of<BuilderCubit>(context).state
        as EditQuestionBuilderState;
    _data = state.selectedQuestion! as ChoiceQuestionData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        CommonCustomizationTab(title: context.localization.common),
        ChoiceButtonsCustomizationTab(
          title: _data.isMultipleChoice
              ? context.localization.check_box
              : context.localization.radio_button,
        ),
        ChoiceContentCustomizationTab(
          // TODO(dev): do we need this?
          key: UniqueKey(),
          title: context.localization.content,
        ),
      ],
    );
  }
}
