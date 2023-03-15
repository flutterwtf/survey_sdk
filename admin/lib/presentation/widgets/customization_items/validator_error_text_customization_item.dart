import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class ValidatorErrorTextCustomizationItem extends StatelessWidget {
  final ValueChanged<String> onErrorTextChanged;
  final String? initialValue;

  const ValidatorErrorTextCustomizationItem({
    required this.onErrorTextChanged,
    this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: AppDimensions.sizeXL,
      child: CustomizationTextField(
        initialValue: initialValue,
        onChanged: (value) {
          if (value != null) onErrorTextChanged(value);
        },
        maxLines: null,
        hintText: context.localization.validator_error_hint,
      ),
    );
  }
}
