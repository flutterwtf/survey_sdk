import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class SliderCustomizationPanel extends StatelessWidget {
  const SliderCustomizationPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        SliderCommonCustomizationTab(
          title: context.localization.common,
          onButtonDownColorChanged: (value) {},
          onButtonUpColorChanged: (value) {},
          onFillColorChanged: (value) {},
          onSubtitleColorChanged: (value) {},
          onTitleColorChanged: (value) {},
          onTitleChanged: (String? value) {},
          onSubtitleChanged: (String? value) {},
          onButtonDownChanged: (String? value) {},
          onButtonBorderChanged: (String? value) {},
        ),
        SliderCustomizationTab(
          title: context.localization.slider,
          onActiveColorChanged: (value) {},
          onInactiveColorChanged: (value) {},
          onThicknessChanged: (value) {},
          onThumbChanged: (value) {},
          onThumbColorChanged: (value) {},
        ),
        SliderContentCustomizationTab(
          title: context.localization.content,
          onDivisionsChanged: (value) {},
          onMinMaxChanged: (min, max) {},
          onSubtitleChanged: (value) {},
          onTitleChanged: (value) {},
        ),
      ],
    );
  }
}
