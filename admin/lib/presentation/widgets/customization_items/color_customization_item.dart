import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class ColorCustomizationItem extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;

  const ColorCustomizationItem({
    super.key,
    required this.initialColor,
    required this.onColorPicked,
  });

  @override
  State<ColorCustomizationItem> createState() => _ColorCustomizationItemState();
}

class _ColorCustomizationItemState extends State<ColorCustomizationItem> {
  late Color _pickedColor;
  final TextEditingController _controller = TextEditingController();
  bool _isPickerOpened = false;

  @override
  void initState() {
    _controller.text = colorToString(widget.initialColor);
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // TODO(dev): Why is it "public"? Need to check all other places.
  void onChangedTextField(String? value) {
    if (value != null) {
      final color = int.tryParse(value.padRight(8, '0'), radix: 16);
      if (color != null) {
        setState(() {
          _pickedColor = Color(color);
        });
      }
    }
  }

  void onColorChanged(Color color) {
    widget.onColorPicked(color);
    setState(() {
      _pickedColor = color;
      _controller.text = colorToString(color);
    });
  }

  String colorToString(Color color) =>
      color.value.toRadixString(16).toUpperCase();

  void updateTextField() {
    widget.onColorPicked(_pickedColor);
    setState(
      () => _controller.text = colorToString(_pickedColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => setState(() => _isPickerOpened = !_isPickerOpened),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: _pickedColor,
                ),
                width: AppDimensions.sizeM,
                height: AppDimensions.sizeM,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(AppDimensions.margin2XS),
                child: CustomizationTextField(
                  controller: _controller,
                  onEditingComplete: updateTextField,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9a-fA-F]'),
                    ),
                    LengthLimitingTextInputFormatter(8),
                  ],
                  onChanged: onChangedTextField,
                ),
              ),
            ),
          ],
        ),
        if (_isPickerOpened) ...[
          const SizedBox(
            height: AppDimensions.margin2XS,
          ),
          ColorPicker(
            pickerColor: _pickedColor,
            onColorChanged: onColorChanged,
            portraitOnly: true,
            pickerAreaHeightPercent: 0.4,
          ),
        ]
      ],
    );
  }
}
