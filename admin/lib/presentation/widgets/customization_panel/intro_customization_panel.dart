import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class IntroCustomizationPanel extends StatelessWidget {
  const IntroCustomizationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        IntroCommonCustomizationTab(
          title: context.localization.common,
          onFillColorPicked: (color) {},
          onButtonColorPicked: (color) {},
          onTitleColorPicked: (color) {},
          onTitleFontSizeChanged: (size) {},
          onSubtitleColorPicked: (color) {},
          onSubtitleFontSizeChanged: (size) {},
          onButtonTextColorPicked: (color) {},
          onButtonFontSizeChanged: (size) {},
          onButtonRadiusChanged: (value) {},
        ),
        IntroContentCustomizationTab(
          title: context.localization.content,
          onTitleChanged: (title) {},
          onSubtitleChanged: (subtitle) {},
          onPrimaryButtonTextChanged: (text) {},
          onSecondaryButtonChanged: (isShown, text) {},
        ),
      ],
    );
  }
}
