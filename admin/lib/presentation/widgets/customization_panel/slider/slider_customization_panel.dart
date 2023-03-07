import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/question_data_transformers.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class SliderCustomizationPanel extends StatelessWidget {
  // TODO(dev): may be we can find a better name?
  final SliderQuestionTransformers transformers;

  const SliderCustomizationPanel({
    required this.transformers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        SliderCommonCustomizationTab(
          title: context.localization.common,
          onButtonTextColorChanged: transformers.updateButtonTextColor,
          onButtonColorChanged: transformers.updateButtonUpColor,
          onFillColorChanged: transformers.updateFillColor,
          onSubtitleColorChanged: transformers.updateSubtitleColor,
          onTitleColorChanged: transformers.updateTitleColor,
          onTitleFontSizeChanged: transformers.updateTitleFontSize,
          onSubtitleFontSizeChanged: transformers.updateSubtitleFontSize,
          onButtonFontSizeChanged: transformers.updateButtonFontSize,
          onButtonRadiusChanged: transformers.updateButtonRadius,
        ),
        SliderCustomizationTab(
          title: context.localization.slider,
          onActiveColorChanged: transformers.updateActiveColor,
          onInactiveColorChanged: transformers.updateInactiveColor,
          onThicknessChanged: transformers.updateThickness,
          onThumbSizeChanged: transformers.updateThumbSize,
          onThumbColorChanged: transformers.updateThumbColor,
        ),
        SliderContentCustomizationTab(
          title: context.localization.content,
          onDivisionsChanged: transformers.updateDivisions,
          onMinMaxChanged: transformers.updateMinMax,
          onSubtitleChanged: transformers.updateSubtitle,
          onTitleChanged: transformers.updateTitle,
        ),
      ],
    );
  }
}
