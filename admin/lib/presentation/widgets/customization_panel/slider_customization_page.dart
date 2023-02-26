import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider_common_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider_content_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class SliderCustomizationPage extends StatelessWidget {
  const SliderCustomizationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      panels: [
        SliderCommonCustomizationPanel(
          title: context.localization.common,
          onButtonDownColorChanged: (value) {},
          onButtonUpColorChanged: (value) {},
          onFillColorChanged: (value) {},
          onSubtitleColorChanged: (value) {},
          onTitleColorChanged: (value) {},
        ),
        SliderCustomizationPanel(
          title: context.localization.slider,
          onActiveColorChanged: (value) {},
          onInactiveColorChanged: (value) {},
          onThicknessChanged: (value) {},
          onThumbChanged: (value) {},
          onThumbColorChanged: (value) {},
        ),
        SliderContentCustomizationPanel(
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
