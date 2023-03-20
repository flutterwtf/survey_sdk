import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class IntroCustomizationPanel extends StatelessWidget {
  const IntroCustomizationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        CommonCustomizationTab(
        // TODO(dev): We can remove title property probably.
          title: context.localization.common,
        ),
        IntroContentCustomizationTab(
          title: context.localization.content,
        ),
      ],
    );
  }
}
