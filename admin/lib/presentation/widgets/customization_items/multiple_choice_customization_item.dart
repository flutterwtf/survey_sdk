import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

class MultipleChoiceCustomizationItem extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool isMultipleChoice;

  const MultipleChoiceCustomizationItem({
    required this.onChanged,
    this.isMultipleChoice = false,
    super.key,
  });

  @override
  State<MultipleChoiceCustomizationItem> createState() =>
      _MultipleChoiceCustomizationItemState();
}

class _MultipleChoiceCustomizationItemState
    extends State<MultipleChoiceCustomizationItem> {
  late bool _isMultipleChoice;

  @override
  void initState() {
    super.initState();

    _isMultipleChoice = widget.isMultipleChoice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchCustomizationItem(
          title: context.localization.multiple_choice,
          onChanged: (isToggled) {
            setState(() => _isMultipleChoice = isToggled);
            widget.onChanged(_isMultipleChoice);
          },
        ),
      ],
    );
  }
}
