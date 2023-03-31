import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class ColorCustomizationItem extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;
  final String? initialSize;
  final ValueChanged<double>? onSizeChanged;
  final InputDecoration? decoration;

  const ColorCustomizationItem({
    required this.initialColor,
    required this.onColorPicked,
    this.initialSize,
    this.onSizeChanged,
    this.decoration,
    super.key,
  });

  @override
  State<ColorCustomizationItem> createState() => _ColorCustomizationItemState();
}

class _ColorCustomizationItemState extends State<ColorCustomizationItem> {
  late Color _pickedColor;
  final TextEditingController _controller = TextEditingController();
  bool _isPickerOpened = false;
  final _pickerAreaHeightPercent = 0.4;
  final _lengthInputFormatters = 8;
  final _radix = 16;

  @override
  void initState() {
    super.initState();

    _controller.text = _colorToString(widget.initialColor);
    _pickedColor = widget.initialColor;
  }

  void _onChangedTextField(String? value) {
    if (value != null) {
      final color = int.tryParse(value.padRight(8, '0'), radix: 16);
      if (color != null) {
        setState(() => _pickedColor = Color(color));
      }
    }
  }

  void _onColorChanged(Color color) {
    widget.onColorPicked(color);
    setState(() {
      _pickedColor = color;
      _controller.text = _colorToString(color);
    });
  }

  String _colorToString(Color color) =>
      color.value.toRadixString(_radix).toUpperCase();

  void _updateTextField() {
    widget.onColorPicked(_pickedColor);
    setState(() => _controller.text = _colorToString(_pickedColor));
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
                  color: _pickedColor,
                  border: const Border.fromBorderSide(
                    BorderSide(color: AppColors.greyBackground),
                  ),
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
                  onEditingComplete: _updateTextField,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9a-fA-F]'),
                    ),
                    LengthLimitingTextInputFormatter(_lengthInputFormatters),
                  ],
                  decoration: widget.decoration ??
                      const InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                      ),
                  onChanged: _onChangedTextField,
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
            onColorChanged: _onColorChanged,
            portraitOnly: true,
            pickerAreaHeightPercent: _pickerAreaHeightPercent,
          ),
        ],
      ],
    );
  }
}
