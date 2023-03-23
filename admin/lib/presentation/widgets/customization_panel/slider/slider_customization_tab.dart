import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/size_handler.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/thickness_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class SliderCustomizationTab extends CustomizationTab {
  const SliderCustomizationTab({
    required super.title,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => SliderCustomizationTabState();
}

class SliderCustomizationTabState
    extends CustomizationTabState<SliderCustomizationTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        final data = (state! as EditQuestionBuilderState).selectedQuestion!
            as SliderQuestionData;
        final theme = data.theme ?? const SliderQuestionTheme.common();
        return ListView(
          children: [
            CustomizationItemsContainer(
              title: context.localization.thickness,
              isTopDividerShown: true,
              children: [
                ThicknessCustomizationItem(
                  onThicknessChanged: (value) {
                    if (value == null) return;

                    final thickness = double.tryParse(value);
                    if (thickness != null) {
                      cubit.updateQuestionData(
                        data.copyWith(
                          theme: theme.copyWith(thickness: thickness),
                        ),
                      );
                    }
                  },
                  initialSize: AppFonts.sizeL,
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.active,
              children: [
                ColorCustomizationItem(
                  initialColor: AppColors.switchBackgroundActive,
                  onColorPicked: (color) => cubit.updateQuestionData(
                    data.copyWith(
                      theme: theme.copyWith(activeColor: color),
                    ),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.inactive,
              children: [
                ColorCustomizationItem(
                  initialColor: AppColors.switchBackgroundInactive,
                  onColorPicked: (color) => cubit.updateQuestionData(
                    data.copyWith(
                      theme: theme.copyWith(inactiveColor: color),
                    ),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.thumb,
              children: [
                ColorCustomizationItem(
                  initialColor: AppColors.textHintGrey,
                  onColorPicked: (color) => cubit.updateQuestionData(
                    data.copyWith(
                      theme: theme.copyWith(thumbColor: color),
                    ),
                  ),
                  initialSize: AppFonts.sizeL.toString(),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    suffixText: context.localization.px,
                    suffixStyle: context.theme.textTheme.bodyLarge,
                  ),
                  onSizeChanged: (radius) => cubit.updateQuestionData(
                    data.copyWith(
                      theme: theme.copyWith(thumbRadius: radius),
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
