import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';

class CustomizationPanelForSlider extends StatelessWidget {
  final int initialThumpSize;
  final int initialThicknessSize;

  const CustomizationPanelForSlider({
    super.key,
    required this.initialThicknessSize,
    required this.initialThumpSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TitleForSliderElement(title: 'Thickness'),
        ThicknessFormField(initialSize: initialThicknessSize),
        const Divider(),
        const _TitleForSliderElement(title: 'Active'),
        ColorCustomizationItem(
          initialColor: AppColors.switchBackgroundActive,
          onColorPicked: (Color value) {},
        ),
        const Divider(),
        const _TitleForSliderElement(title: 'Inactive'),
        ColorCustomizationItem(
          initialColor: AppColors.switchBackgroundInactive,
          onColorPicked: (Color value) {},
        ),
        const Divider(),
        const _TitleForSliderElement(title: 'Thumb'),
        FormBuilder(
          child: Row(
            children: [
              Expanded(
                child: ColorCustomizationItem(
                  initialColor: AppColors.switchBackgroundActive,
                  onColorPicked: (Color value) {},
                ),
              ),
              Expanded(
                child: ThicknessFormField(initialSize: initialThumpSize),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class ThicknessFormField extends StatelessWidget {
  final int initialSize;

  const ThicknessFormField({
    super.key,
    required this.initialSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.marginM),
      child: Row(
        children: [
          SizedBox(
            width: AppDimensions.marginLargeM,
            child: TextFormField(
              initialValue: initialSize.toString(),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
            ),
          ),
          const Text(
            'px',
            style: TextStyle(
              fontSize: AppFonts.sizeL,
              fontWeight: AppFonts.weightRegular,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleForSliderElement extends StatelessWidget {
  final String title;

  const _TitleForSliderElement({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.marginM,
        vertical: AppDimensions.margin2XS,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: AppFonts.sizeL,
          fontWeight: AppFonts.weightSemiBold,
          color: AppColors.black,
        ),
      ),
    );
  }
}
