import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class SliderCustomizationPanel extends StatelessWidget {
  const SliderCustomizationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        CommonCustomizationTab(
          title: context.localization.common,
        ),
        SliderCustomizationTab(
          title: context.localization.slider,
        ),
        SliderContentCustomizationTab(
          title: context.localization.content,
        ),
      ],
    );
  }
}
