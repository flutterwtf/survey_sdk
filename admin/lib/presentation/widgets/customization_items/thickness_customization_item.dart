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

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.text = widget.initialSize.toString();
    super.initState();
  }

  void _thicknessChanged(String? text) {
    if (text != null) {
      final thickness = double.tryParse(text) ?? 1;
      final validThickness = min(thickness, widget.maxThickness);
      widget.onThicknessChanged(validThickness);
      _textEditingController.value = _textEditingController.value.copyWith(
        text: validThickness.toString(),
        selection:
            TextSelection.collapsed(offset: _textEditingController.text.length),
      );
    } else {
      widget.onThicknessChanged(widget.maxThickness);
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 2;
    return Row(
      children: [
        SizedBox(
          width: AppDimensions.marginXL,
          child: CustomizationTextField(
            controller: _textEditingController,
            onChanged: _thicknessChanged,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(lengthInputFormatter),
            ],
          ),
        ),
        Text(
          context.localization.px,
          style: context.theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
