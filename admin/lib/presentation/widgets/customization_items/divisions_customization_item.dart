import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

const _initialValue = 10;

class DivisionsCustomizationItem extends StatelessWidget {
  final int initialValue;
  final void Function(int divisions) onChanged;

  const DivisionsCustomizationItem({
    required this.onChanged,
    this.initialValue = _initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 3;
    return CustomizationTextField(
      initialValue: initialValue.toString(),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(lengthInputFormatter),
      ],
      onChanged: (value) => SizeHandler.onIntSizeChanged(value, onChanged),
    );
  }
}
