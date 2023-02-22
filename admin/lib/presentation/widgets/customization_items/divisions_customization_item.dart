import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';

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
    return FormBuilder(
      child: FormBuilderTextField(
        name: context.localization.divisions,
        initialValue: initialValue.toString(),
        onChanged: (divisions) {
          if (divisions != null) {
            onChanged(int.tryParse(divisions));
          } else {
            onChanged(null);
          }
        },
        decoration: const InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
        ),
        style: const TextStyle(
          fontSize: AppFonts.sizeL,
          fontWeight: AppFonts.weightRegular,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
        ],
      ),
    );
  }
}
