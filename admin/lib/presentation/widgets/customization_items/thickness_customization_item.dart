import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';

class ThicknessCustomizationItem extends StatelessWidget {
  final ValueChanged<String?> onThicknessChanged;
  final double initialSize;

  const ThicknessCustomizationItem({
    super.key,
    required this.initialSize,
    required this.onThicknessChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppDimensions.marginLargeM,
          child: CustomizationTextField(
            onChanged: onThicknessChanged,
            initialValue: initialSize.toString(),
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
    );
  }
}