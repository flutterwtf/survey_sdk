import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class CustomizationMultilineTextField extends StatefulWidget {
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
  State<CustomizationMultilineTextField> createState() => _CustomizationMultilineTextFieldState();
}

class _CustomizationMultilineTextFieldState extends State<CustomizationMultilineTextField> {
  @override
  Widget build(BuildContext context) {
    /// LimitedBox, isCollapsed: true, maxLines: null - used to make
    /// this TextField expandable.
    return LimitedBox(
      maxHeight: widget.maxHeight,
      child: CustomizationTextField(
        initialValue: widget.value,
        onChanged: (value) {
          if (value != null) widget.onChanged(value);
        },
        style: context.theme.textTheme.bodyLarge,
        hintText: context.localization.enter_text,
        maxLines: null,
      ),
    );
  }
}
