import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class ThicknessCustomizationItem extends StatefulWidget {
  final ValueChanged<double> onThicknessChanged;
  final double initialSize;
  final double maxThickness;

  const ThicknessCustomizationItem({
    required this.initialSize,
    required this.onThicknessChanged,
    required this.maxThickness,
    super.key,
  });

  @override
  State<ThicknessCustomizationItem> createState() =>
      _ThicknessCustomizationItemState();
}

class _ThicknessCustomizationItemState
    extends State<ThicknessCustomizationItem> {
  late final TextEditingController _textEditingController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
    _textEditingController.text = widget.initialSize.toString();

    _focusNode.addListener(
      () {
        if (!_focusNode.hasFocus && _textEditingController.text.isEmpty) {
          _textEditingController.text = widget.initialSize.toString();
        }
      },
    );
  }

  void _thicknessChanged(String? text) {
    final thickness = double.tryParse(text ?? '');
    if (_textEditingController.text == '0') {
      _handleThicknessChange(widget.maxThickness);
    } else if (thickness != null) {
      _handleThicknessChange(min(thickness, widget.maxThickness));
    } else {
      widget.onThicknessChanged(widget.maxThickness);
    }
  }

  void _handleThicknessChange(double thickness) {
    widget.onThicknessChanged(thickness);
    _textEditingController.value = _textEditingController.value.copyWith(
      text: thickness.toString(),
      selection: TextSelection.collapsed(
        offset: _textEditingController.text.length,
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 2;
    return Row(
      children: [
        SizedBox(
          width: AppDimensions.thicknessItemWidth,
          child: CustomizationTextField(
            controller: _textEditingController,
            focusNode: _focusNode,
            onChanged: _thicknessChanged,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              _NoZeroFormatter(),
              LengthLimitingTextInputFormatter(lengthInputFormatter),
            ],
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              suffix: Text(
                context.localization.px,
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NoZeroFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.text == '0' && newValue.selection.baseOffset > 0
        ? oldValue
        : newValue;
  }
}
