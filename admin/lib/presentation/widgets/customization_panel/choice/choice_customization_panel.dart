import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/question_data_transformers.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_buttons_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class ChoiceCustomizationPanel extends StatelessWidget {
  final ChoiceQuestionTransformers transformers;

  const ChoiceCustomizationPanel({
    required this.transformers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        ChoiceCommonCustomizationTab(
          title: context.localization.common,
          onFillColorPicked: transformers.updateFillColor,
          onTitleColorPicked: transformers.updateTitleColor,
          onTitleFontSizeChanged: transformers.updateTitleFontSize,
          onSubtitleColorPicked: transformers.updateSubtitleColor,
          onSubtitleFontSizeChanged: transformers.updateSubtitleFontSize,
          onButtonColorPicked: transformers.updateButtonColor,
          onButtonTextColorPicked: transformers.updateButtonTextColor,
          onButtonFontSizeChanged: transformers.updateButtonFontSize,
          onButtonRadiusChanged: transformers.updateButtonRadius,
        ),
        ChoiceButtonsCustomizationTab(
          title: context.localization.radio_button,
          onActiveColorPicked: transformers.updateActiveColor,
          onInactiveColorPicked: transformers.updateInactiveColor,
        ),
        ChoiceContentCustomizationTab(
          title: context.localization.content,
          onTitleChanged: transformers.updateTitle,
          onSubTitleChanged: transformers.updateSubtitle,
          onOptionsChanged: transformers.updateOptions,
        ),
      ],
    );
  }
}
