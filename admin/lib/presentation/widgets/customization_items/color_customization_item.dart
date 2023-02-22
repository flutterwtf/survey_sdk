import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';

class ColorCustomizationItem extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;

  const ColorCustomizationItem({
    required this.initialColor,
    required this.onColorPicked,
    Key? key,
  }) : super(key: key);

  @override
  State<ColorCustomizationItem> createState() => _ColorCustomizationItemState();
}

class _ColorCustomizationItemState extends State<ColorCustomizationItem> {
  late Color _pickerColor;
  final TextEditingController _controller = TextEditingController();
  bool _isPickerOpened = false;

  @override
  void initState() {
    _controller.text = colorToString(widget.initialColor);
    _pickerColor = widget.initialColor;
    super.initState();
  }

  void onChangedTextField(String? value) {
    if (value != null) {
      final color = int.tryParse(value.padRight(8, '0'), radix: 16);
      if (color != null) {
        setState(() {
          _pickerColor = Color(color);
        });
      }
    }
  }

  void onColorChanged(color) {
    widget.onColorPicked(color);
    setState(() {
      _pickerColor = color;
      _controller.text = colorToString(color);
    });
  }

  String colorToString(Color color) => color.value.toRadixString(16).toUpperCase();

  void updateTextField() {
    widget.onColorPicked(_pickerColor);
    setState(
      () => _controller.text = colorToString(_pickerColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.marginM),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _isPickerOpened = !_isPickerOpened),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    color: _pickerColor,
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
              pickerColor: _pickerColor,
              onColorChanged: onColorChanged,
              portraitOnly: true,
              pickerAreaHeightPercent: 0.4,
            ),
          ]
        ],
      ),
    );
  }
}
