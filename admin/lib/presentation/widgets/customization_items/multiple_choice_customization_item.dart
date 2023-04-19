import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

class MultipleChoiceCustomizationItem extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  const MultipleChoiceCustomizationItem({
    required this.onChanged,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchCustomizationItem(
          initialValue: value,
          title: context.localization.multiple_choice,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
