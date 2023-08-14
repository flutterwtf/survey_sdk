import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_sdk/survey_sdk.dart';

class SliderCustomizationPanel extends StatelessWidget {
  final ValueChanged<QuestionData> onChange;
  final SliderQuestionData editable;
  final int? questionsAmount;

  const SliderCustomizationPanel({
    required this.onChange,
    required this.editable,
    required this.questionsAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        SliderContentCustomizationTab(
          onChange: onChange,
          title: context.localization.content,
          editable: editable,
          questionsAmount: questionsAmount,
        ),
        SliderCustomizationTab(
          onChange: onChange,
          title: context.localization.slider,
          editable: editable,
        ),
        SliderCommonCustomizationTab(
          onChange: onChange,
          title: context.localization.common,
          editable: editable,
        ),
      ],
    );
  }
}
