import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class RadiusCustomizationItem extends StatelessWidget {
  final double initialValue;
  final ValueChanged<int> onRadiusChanged;

  const RadiusCustomizationItem({
    required this.initialValue,
    required this.onRadiusChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 2;
    return Row(
      children: [
        SvgPicture.asset(AppAssets.arcIcon),
        const SizedBox(width: AppDimensions.margin2XS),
        Expanded(
          child: CustomizationTextField(
            initialValue: initialValue.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(lengthInputFormatter),
            ],
            onChanged: (value) => SizeHandler.onSizeChanged(
              value,
              onRadiusChanged,
            ),
          ),
        ),
      ],
    );
  }
}
