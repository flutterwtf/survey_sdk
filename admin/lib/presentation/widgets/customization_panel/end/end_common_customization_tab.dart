import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/base/customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_sdk/survey_sdk.dart';

class EndCommonCustomizationTab extends CustomizationTab {
  final ValueChanged<QuestionData> onChange;
  final EndQuestionData editable;

  const EndCommonCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  EndQuestionTheme get theme =>
      editable.theme ?? const EndQuestionTheme.common();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.fill,
          shouldShowTopDivider: true,
          children: [
            ColorCustomizationItem(
              initialColor: theme.fill,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(fill: color),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.title,
          children: [
            TextStyleCustomizationItem(
              initialColor: theme.titleColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(titleColor: color),
                ),
              ),
              initialSize: theme.titleSize,
              onSizeChanged: (size) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(titleSize: size),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            TextStyleCustomizationItem(
              initialColor: theme.subtitleColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(subtitleColor: color),
                ),
              ),
              initialSize: theme.subtitleSize,
              onSizeChanged: (size) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(subtitleSize: size),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
