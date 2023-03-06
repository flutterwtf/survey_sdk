import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/question_data_transformers.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class IntroCustomizationPanel extends StatelessWidget {
  // TODO(dev): rename
  final IntroQuestionTransformers transformers;

  const IntroCustomizationPanel({
    required this.transformers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        IntroCommonCustomizationTab(
          title: context.localization.common,
          onFillColorPicked: transformers.updateFillColor,
          onButtonColorPicked: transformers.updateButtonColor,
          onTitleColorPicked: transformers.updateTitleColor,
          onTitleFontSizeChanged: transformers.updateTitleFontSize,
          onSubtitleColorPicked: transformers.updateSubtitleColor,
          onSubtitleFontSizeChanged: transformers.updateSubtitleFontSize,
          onButtonTextColorPicked: transformers.updateButtonTextColor,
          onButtonFontSizeChanged: transformers.updateButtonFontSize,
          onButtonRadiusChanged: transformers.updateButtonRadius,
        ),
        IntroContentCustomizationTab(
          title: context.localization.content,
          onTitleChanged: transformers.updateTitle,
          onSubtitleChanged: transformers.updateSubtitle,
          onPrimaryButtonTextChanged: transformers.updatePrimaryButtonText,
          onSecondaryButtonChanged: transformers.updateSecondaryButton,
        ),
      ],
    );
  }
}
