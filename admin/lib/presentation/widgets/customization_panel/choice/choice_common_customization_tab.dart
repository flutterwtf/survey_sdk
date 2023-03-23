import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceCommonCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;

  const ChoiceCommonCustomizationTab({
    required this.onChange,
    required super.title,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => CommonCustomizationTabState();
}

class CommonCustomizationTabState
    extends CustomizationTabState<ChoiceCommonCustomizationTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuilderCubit, BuilderState>(
      builder: (context, state) {
        final data = (state as EditQuestionBuilderState).selectedQuestion!
        as IntroQuestionData;
        final theme = data.theme ?? const IntroQuestionTheme.common();
        return ListView(
          children: [
            CustomizationItemsContainer(
              title: context.localization.fill,
              isTopDividerShown: true,
              children: [
                ColorCustomizationItem(
                  initialColor: AppColors.white,
                  onColorPicked: (color) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(fill: color),
                    ),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.title,
              children: [
                ColorCustomizationItem(
                  initialColor: AppColors.black,
                  onColorPicked: (color) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(titleColor: color),
                    ),
                  ),
                  initialSize: AppFonts.sizeL.toString(),
                  onSizeChanged: (size) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(titleSize: size),
                    ),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.subtitle,
              children: [
                ColorCustomizationItem(
                  initialColor: AppColors.black,
                  onColorPicked: (color) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(subtitleColor: color),
                    ),
                  ),
                  initialSize: AppFonts.sizeS.toString(),
                  onSizeChanged: (size) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(subtitleSize: size),
                    ),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.button,
              children: [
                ColorCustomizationItem(
                  initialColor: AppColors.black,
                  onColorPicked: (color) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(buttonTextColor: color),
                    ),
                  ),
                  initialSize: AppFonts.sizeS.toString(),
                  onSizeChanged: (size) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(buttonTextSize: size),
                    ),
                  ),
                ),
                RadiusCustomizationItem(
                  initialValue: AppDimensions.circularRadiusS,
                  onRadiusChanged: (radius) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(buttonRadius: radius),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
