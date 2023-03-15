import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';

import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';

class ValidatorErrorTextCustomizationItem extends StatelessWidget {
  final Function(String errorText) onErrorTextChanged;
  final String? initialValue;

  const ValidatorErrorTextCustomizationItem({
    required this.onErrorTextChanged,
    this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.margin2XS,
        horizontal: AppDimensions.marginM,
      ),
      child: TextFormField(
        initialValue: initialValue ?? '',
        onChanged: onErrorTextChanged,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          hintText: context.localization.validator_error_hint,
        ),
      ),
    );
  }
}
