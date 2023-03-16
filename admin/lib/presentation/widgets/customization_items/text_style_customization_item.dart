import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class TextStyleCustomizationItem extends StatefulWidget {
  final Color initialColor;
  final double initialFontSize;
  final ValueChanged<Color> onColorPicked;
  final ValueChanged<double> onFontSizeChanged;
  final InputDecoration? decoration;

  const TextStyleCustomizationItem({
    required this.initialColor,
    required this.onColorPicked,
    required this.initialFontSize,
    required this.onFontSizeChanged,
    this.decoration,
    super.key,
  });

  @override
  State<TextStyleCustomizationItem> createState() =>
      _TextStyleCustomizationItemState();
}

class _TextStyleCustomizationItemState
    extends State<TextStyleCustomizationItem> {
  late Color _pickedColor;
  late double _pickedFontSize;
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _fontSizeController = TextEditingController();
  bool _isPickerOpened = false;
  final _defaultDecoration = const InputDecoration(
    isCollapsed: true,
    border: InputBorder.none,
  );

  @override
  void initState() {
    _colorController.text = _colorToString(widget.initialColor);
    _fontSizeController.text = widget.initialFontSize.toString();
    _pickedColor = widget.initialColor;
    _pickedFontSize = widget.initialFontSize;
    super.initState();
  }

  @override
  void dispose() {
    _colorController.dispose();
    super.dispose();
  }

  void _onChangedColorTextField(String? value) {
    if (value != null) {
      final color = int.tryParse(value.padRight(8, '0'), radix: 16);
      if (color != null) {
        setState(() {
          _pickedColor = Color(color);
        });
      }
    }
  }

  void _onChangedFontSizeTextField(String? value) {
    if (value != null) {
      _pickedFontSize = double.parse(value);
      widget.onFontSizeChanged(_pickedFontSize);
    }
  }

  void _onColorChanged(Color color) {
    widget.onColorPicked(color);
    setState(() {
      _pickedColor = color;
      _colorController.text = _colorToString(color);
    });
  }

  String _colorToString(Color color) =>
      color.value.toRadixString(16).toUpperCase();

  void _updateColorTextField() {
    widget.onColorPicked(_pickedColor);
    setState(
      () => _colorController.text = _colorToString(_pickedColor),
    );
  }

  void _updateFontSizeTextField() {
    widget.onFontSizeChanged(_pickedFontSize);
    setState(() => _fontSizeController.text = _pickedFontSize.toString());
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
                  controller: _colorController,
                  onEditingComplete: _updateColorTextField,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9a-fA-F]'),
                    ),
                    LengthLimitingTextInputFormatter(8),
                  ],
                  onChanged: _onChangedColorTextField,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(AppDimensions.margin2XS),
                child: CustomizationTextField(
                  decoration: widget.decoration ?? _defaultDecoration,
                  controller: _fontSizeController,
                  onEditingComplete: _updateFontSizeTextField,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  onChanged: _onChangedFontSizeTextField,
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
            pickerAreaHeightPercent: 0.4,
          ),
        ]
      ],
    );
  }
}
