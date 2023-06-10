import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class DivisionsCustomizationItem extends StatefulWidget {
  final int maxValue;
  final int initialValue;
  final void Function(int divisions) onChanged;

  const DivisionsCustomizationItem({
    required this.onChanged,
    required this.initialValue,
    required this.maxValue,
    super.key,
  });

  @override
  State<DivisionsCustomizationItem> createState() =>
      _DivisionsCustomizationItemState();
}

class _DivisionsCustomizationItemState
    extends State<DivisionsCustomizationItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue.toString());
  }

  String? _validator(String? value) {
    final divisions = int.tryParse(value ?? '');

    if (divisions != null) {
      if (divisions > widget.maxValue) {
        return '$divisions <= ${widget.maxValue}';
      } else if (divisions == 0) {
        return 'divisions != 0';
      }
    }

    return null;
  }

  bool _canCallParentOnChanged(int value) =>
      value <= widget.maxValue && value != 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 3;
    _controller
      ..text = widget.initialValue.toString()
      ..selection = TextSelection.collapsed(offset: _controller.text.length);

    return CustomizationTextField.int(
      controller: _controller,
      validator: _validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        LengthLimitingTextInputFormatter(lengthInputFormatter),
      ],
      onChanged: (value) {
        final divisions = int.parse(value!);
        if (_canCallParentOnChanged(divisions)) {
          widget.onChanged(divisions);
        }
      },
    );
  }
}
