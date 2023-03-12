import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

// TODO(dev): why do we have pages in this folder?
class InputCustomizationPanel extends StatelessWidget {
  const InputCustomizationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        InputCommonCustomizationTab(
          title: context.localization.common,
          onFillColorPicked: (color) {},
          onTitleColorPicked: (color) {},
          onTitleFontSizeChanged: (size) {},
          onSubtitleColorPicked: (color) {},
          onSubtitleFontSizeChanged: (size) {},
          onButtonFirstColorPicked: (color) {},
          onButtonSecondColorPicked: (color) {},
          onButtonFontSizeChanged: (size) {},
        ),
        InputCustomizationTab(
          title: context.localization.input,
          onMultilineChanged: (isMultiline, lineAmount) {},
          onFillColorChanged: (color) {},
          onBorderColorChanged: (color) {},
          onBorderSizeChanged: (size) {},
          onBorderWidthChanged: (size) {},
          onHorizontalPaddingChanged: (size) {},
          onVerticalPaddingChanged: (size) {},
          onHintColorChanged: (color) {},
          onHintFontSizeChanged: (size) {},
          onTextColorChanged: (color) {},
          onTextFontSizeChanged: (size) {},
          onInputTypeChanged: (inputType) {},
        ),
        InputContentCustomizationTab(
          title: context.localization.content,
          onTitleChanged: (text) {},
          onSubtitleChanged: (text) {},
          onHintTextChanged: (text) {},
          onButtonTextChanged: (text) {},
        ),
      ],
    );
  }
}
