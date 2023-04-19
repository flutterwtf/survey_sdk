import 'dart:math';

import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/double_input_formatter.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class ColorThicknessCustomizationItem extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;
  final double initialThickness;
  final double? maxThickness;
  final ValueChanged<double> onThicknessChanged;

  const ColorThicknessCustomizationItem({
    required this.initialColor,
    required this.onColorPicked,
    required this.initialThickness,
    required this.onThicknessChanged,
    this.maxThickness,
    super.key,
  });

  @override
  State<ColorThicknessCustomizationItem> createState() =>
      _ColorThicknessCustomizationItemState();
}

class _ColorThicknessCustomizationItemState
    extends State<ColorThicknessCustomizationItem> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialThickness.toString();
    super.initState();
  }

  void _onThicknessChanged(String? text) {
    //It is not null anyway because of formatter
    final textFieldText = text!;
    final textToParse = textFieldText[textFieldText.length - 1] == '.'
        ? textFieldText.characters
            .getRange(0, textFieldText.length - 1)
            .toString()
        : textFieldText;
    final thickness = double.tryParse(textToParse) ?? 0;

    if (widget.maxThickness != null) {
      final validThickness = min(thickness, widget.maxThickness!);
      widget.onThicknessChanged(validThickness);
      _controller.value = _controller.value.copyWith(
        text: validThickness.toString(),
        selection: TextSelection.collapsed(offset: _controller.text.length),
      );
    } else {
      widget.onThicknessChanged(thickness);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColorCustomizationItem(
            initialColor: widget.initialColor,
            onColorPicked: widget.onColorPicked,
          ),
        ),
        Expanded(
          child: CustomizationTextField(
            controller: _controller,
            inputFormatters: [
              DoubleInputFormatter(),
            ],
            onChanged: _onThicknessChanged,
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              suffixText: context.localization.px,
              suffixStyle: context.theme.textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
