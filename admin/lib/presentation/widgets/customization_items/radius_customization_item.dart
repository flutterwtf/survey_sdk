import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class RadiusCustomizationItem extends StatelessWidget {
  final String initialValue;
  final ValueChanged<int> onRadiusChanged;

  const RadiusCustomizationItem({
    required this.initialValue,
    required this.onRadiusChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.arcIcon),
        const SizedBox(width: AppDimensions.margin2XS),
        Expanded(
          child: CustomizationTextField(
            initialValue: initialValue,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: (value) {
              if (value == null) return;

              final radius = int.tryParse(value);
              if (radius != null) {
                onRadiusChanged(radius);
              }
            },
          ),
        ),
      ],
    );
  }
}
