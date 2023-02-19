import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
  late Color pickerColor;
  TextEditingController controller = TextEditingController();
  bool isPickerOpened = false;

  @override
  void initState() {
    controller.text = colorToString(widget.initialColor);
    pickerColor = widget.initialColor;
    super.initState();
  }

  void onChangedTextField(String? value) {
    if (value != null) {
      final color = int.tryParse(value.padRight(8, '0'), radix: 16);
      if (color != null) {
        setState(() {
          pickerColor = Color(color);
        });
      }
    }
  }

  void onColorChanged(color) {
    widget.onColorPicked(color);
    setState(() => pickerColor = color);
  }

  String colorToString(Color color) =>
      color.value.toRadixString(16).toUpperCase();

  void updateTextField() {
    widget.onColorPicked(pickerColor);
    setState(
      () => controller.text = colorToString(pickerColor),
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
                onTap: () => setState(() => isPickerOpened = !isPickerOpened),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    color: pickerColor,
                  ),
                  width: AppDimensions.sizeM,
                  height: AppDimensions.sizeM,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(AppDimensions.margin2XS),
                  child: CustomizationTextField(
                    controller: controller,
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
          if (isPickerOpened) ...[
            const SizedBox(
              height: AppDimensions.margin2XS,
            ),
            ColorPicker(
              pickerColor: pickerColor,
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
