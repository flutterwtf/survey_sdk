import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/double_input_formatter.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class TextStyleCustomizationItem extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;
  final double initialSize;
  final ValueChanged<double> onSizeChanged;

  const TextStyleCustomizationItem({
    required this.initialColor,
    required this.onColorPicked,
    required this.initialSize,
    required this.onSizeChanged,
    super.key,
  });

  @override
  State<TextStyleCustomizationItem> createState() =>
      _TextStyleCustomizationItemState();
}

class _TextStyleCustomizationItemState
    extends State<TextStyleCustomizationItem> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text =  widget.initialSize.toString();
    super.initState();
  }

  void _onSizeChanged(String? text) {
    //It is not null anyway because of formatter
    final textFieldText = text!;
    final textToParse = textFieldText[textFieldText.length - 1] == '.'
        ? textFieldText.substring(0, textFieldText.length - 1)
        : textFieldText;
    final size = double.tryParse(textToParse) ?? 0;
    widget.onSizeChanged(size);
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
            onChanged: _onSizeChanged,
          ),
        ),
      ],
    );
  }
}
