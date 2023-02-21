import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(
          AppDimensions.marginM,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomizationText(context.localization.divisions),
            FormBuilderTextField(
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
                contentPadding: EdgeInsets.only(
                  top: AppDimensions.marginS,
                ),
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
          ],
        ),
      ),
    );
  }
}
