import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class ThicknessCustomizationItem extends StatelessWidget {
  final ValueChanged<String?> onThicknessChanged;
  final double initialSize;

  const ThicknessCustomizationItem({
    required this.initialSize,
    required this.onThicknessChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppDimensions.marginXL,
          child: CustomizationTextField(
            onChanged: onThicknessChanged,
            initialValue: initialSize.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
          ),
        ),
        Text(
          context.localization.px,
          style: context.theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
