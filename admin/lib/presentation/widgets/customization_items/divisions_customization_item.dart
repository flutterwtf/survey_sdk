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
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue.toString());
    _focusNode = FocusNode()..addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _controller
        ..text = widget.initialValue.toString()
        ..selection = TextSelection.collapsed(offset: _controller.text.length);
    }
  }

  String? _validator(String? value) {
    final divisions = int.tryParse(value ?? '');

    return divisions != null && (divisions > widget.maxValue || divisions == 0)
        ? 'Divisions count should be between 0 and ${widget.maxValue}'
        : null;
  }

  bool _canCallParentOnChanged(int value) =>
      value <= widget.maxValue && value != 0;

  @override
  void dispose() {
    _focusNode.dispose();
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
      focusNode: _focusNode,
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
