import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice_buttons_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class ChoiceCustomizationPanel extends StatelessWidget {
  const ChoiceCustomizationPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        // TODO: add one more panel
        // TODO: localizations
        ChoiceButtonsCustomizationTab(
          title: 'Radio Button',
          onActiveColorPicked: (activeColor) {},
          onInactiveColorPicked: (inactiveColor) {},
        ),
        // TODO: localizations
        ChoiceContentCustomizationTab(
          title: 'Content',
          onTitleChanged: (title) {},
          onSubTitleChanged: (subtitle) {},
          onOptionsChanged: (options) {},
        ),
      ],
    );
  }
}
