import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

class SliderCustomizationPanel extends StatelessWidget {
  final void Function(QuestionData data) onChange;

  const SliderCustomizationPanel({
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        SliderCommonCustomizationTab(
          onChange: onChange,
          title: context.localization.common,
        ),
        SliderCustomizationTab(
          onChange: onChange,
          title: context.localization.slider,
        ),
        SliderContentCustomizationTab(
          onChange: onChange,
          title: context.localization.content,
        ),
      ],
    );
  }
}
