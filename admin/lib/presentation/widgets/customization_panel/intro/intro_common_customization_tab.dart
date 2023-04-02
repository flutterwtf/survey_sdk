import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class IntroCommonCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final IntroQuestionData editable;

  const IntroCommonCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => CommonCustomizationTabState();
}

class CommonCustomizationTabState
    extends CustomizationTabState<IntroCommonCustomizationTab> {
  IntroQuestionTheme get theme =>
      widget.editable.theme ?? const IntroQuestionTheme.common();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.fill,
          isTopDividerShown: true,
          children: [
            ColorCustomizationItem(
              initialColor: theme.fill,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
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
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(titleColor: color),
                ),
              ),
              initialSize: theme.titleSize,
              onSizeChanged: (size) => widget.onChange(
                widget.editable.copyWith(
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
              initialColor: AppColors.black,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(subtitleColor: color),
                ),
              ),
              initialSize: AppFonts.sizeS,
              onSizeChanged: (size) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(subtitleSize: size),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.button,
          children: [
            TextStyleCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(buttonTextColor: color),
                ),
              ),
              initialSize: AppFonts.sizeS,
              onSizeChanged: (size) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(buttonTextSize: size),
                ),
              ),
            ),
            RadiusCustomizationItem(
              initialValue: AppDimensions.circularRadiusS,
              onRadiusChanged: (radius) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(buttonRadius: radius),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
