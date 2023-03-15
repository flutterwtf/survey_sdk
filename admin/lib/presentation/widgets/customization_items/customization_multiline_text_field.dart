import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class CustomizationMultilineTextField extends StatelessWidget {
  final double maxHeight;
  final void Function(String text) onChanged;

  const CustomizationMultilineTextField({
    required this.maxHeight,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // LimitedBox, isCollapsed: true, maxLines: null - used to make
    // this TextField expandable
    return LimitedBox(
      maxHeight: maxHeight,
      child: CustomizationTextField(
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
