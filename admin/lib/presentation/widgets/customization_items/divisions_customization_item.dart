import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class DivisionsCustomizationItem extends StatelessWidget {
  final int initialValue;
  final void Function(int divisions) onChanged;

  const DivisionsCustomizationItem({
    required this.onChanged,
    required this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 3;
    return CustomizationTextField.int(
      initialValue: initialValue.toString(),
      inputFormatters: [
        LengthLimitingTextInputFormatter(lengthInputFormatter),
      ],
      onChanged: (value) => onChanged(int.parse(value!)),
    );
  }
}
