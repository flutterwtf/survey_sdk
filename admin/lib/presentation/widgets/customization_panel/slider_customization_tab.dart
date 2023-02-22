import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/common_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/content_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class SliderCustomizationTab extends StatelessWidget {
  const SliderCustomizationTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      panels: [
        CommonCustomizationPanel(
          title: 'Common',
          onButtonDownColorChanged: (value) {},
          onButtonUpColorChanged: (value) {},
          onFillColorChanged: (value) {},
          onSubtitleColorChanged: (value) {},
          onTitleColorChanged: (value) {},
        ),
        SliderCustomizationPanel(
          title: 'Slider',
          onActiveColorChanged: (value) {},
          onInactiveColorChanged: (value) {},
          onThicknessChanged: (value) {},
          onThumbChanged: (value) {},
          onThumbColorChanged: (value) {},
        ),
        ContentCustomizationPanel(
          title: 'Content',
          onDivisionsChanged: (value) {},
          onMinMaxChanged: (min, max) {},
          onSubtitleChanged: (value) {},
          onTitleChanged: (value) {},
        ),
      ],
    );
  }
}
