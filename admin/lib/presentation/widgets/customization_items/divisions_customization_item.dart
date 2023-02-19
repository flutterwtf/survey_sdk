import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';

class DivisionsCustomizationItem extends StatelessWidget {
  const DivisionsCustomizationItem({
    super.key,
    this.initialValue = 10,
    required this.onChanged,
  });

  final int initialValue;
  final void Function(int? divisions) onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: CustomizationTextField(
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
      ),
    );
  }
}
