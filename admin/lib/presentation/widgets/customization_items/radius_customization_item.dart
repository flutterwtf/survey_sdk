import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_admin/presentation/utils/asset_strings.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class RadiusCustomizationItem extends StatelessWidget {
  final int initialValue;
  final ValueChanged<int?> onRadiusChanged;

  const RadiusCustomizationItem({
    required this.initialValue,
    required this.onRadiusChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AssetStrings.arc),
        const SizedBox(width: AppDimensions.margin2XS),
        Expanded(
          child: CustomizationTextField(
            initialValue: initialValue.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: (size) {
              if (size == null) {
                onRadiusChanged(null);
              } else {
                onRadiusChanged(int.tryParse(size));
              }
            },
          ),
        ),
      ],
    );
  }
}
