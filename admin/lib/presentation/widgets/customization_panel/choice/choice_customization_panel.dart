import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_buttons_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class ChoiceCustomizationPanel extends StatelessWidget {
  const ChoiceCustomizationPanel({
    super.key,
  });

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
          title: context.localization.content,
          onTitleChanged: (title) {},
          onSubTitleChanged: (subtitle) {},
          onOptionsChanged: (options) {},
        ),
      ],
    );
  }
}
