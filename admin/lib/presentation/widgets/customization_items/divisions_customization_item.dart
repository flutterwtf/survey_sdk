import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class DivisionsCustomizationItem extends StatelessWidget {
  final int initialValue;
  final void Function(int? divisions) onChanged;

  const DivisionsCustomizationItem({
    super.key,
    this.initialValue = 10,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomizationTextField(
      initialValue: initialValue.toString(),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      onChanged: (divisions) {
        if (divisions != null) {
          onChanged(int.tryParse(divisions));
        } else {
          onChanged(null);
        }
      },
    );
  }
}
