import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

class CreateTextCustomizationItem extends StatelessWidget {
  final double maxHeight;
  final void Function(String text) onChanged;
  final String? initialText;

  const CreateTextCustomizationItem({
    required this.maxHeight,
    required this.onChanged,
    this.initialText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // LimitedBox, isCollapsed: true, maxLines: null - used to make
    // this TextField expandable
    return LimitedBox(
      maxHeight: maxHeight,
      child: TextFormField(
        initialValue: initialText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: context.localization.enter_text,
          isCollapsed: true,
        ),
        maxLines: null,
        style: context.theme.textTheme.bodyLarge,
        onChanged: onChanged,
      ),
    );
  }
}
