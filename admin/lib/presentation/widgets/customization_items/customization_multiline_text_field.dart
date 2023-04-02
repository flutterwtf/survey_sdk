import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class CustomizationMultilineTextField extends StatelessWidget {
  final double maxHeight;
  final void Function(String text) onChanged;
  final String value;

  const CustomizationMultilineTextField({
    required this.maxHeight,
    required this.onChanged,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// LimitedBox, isCollapsed: true, maxLines: null - used to make
    /// this TextField expandable.
    return LimitedBox(
      maxHeight: maxHeight,
      child: CustomizationTextField(
        initialValue: value,
        onChanged: (value) {
          if (value != null) onChanged(value);
        },
        style: context.theme.textTheme.bodyLarge,
        hintText: context.localization.enter_text,
        maxLines: null,
      ),
    );
  }
}
