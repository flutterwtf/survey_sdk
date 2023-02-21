import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomizationText('Fill'),
          const SizedBox(height: AppDimensions.marginM),
          GestureDetector(
            onTap: pickColor,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    color: currentColor,
                  ),
                  width: AppDimensions.sizeM,
                  height: AppDimensions.sizeM,
                ),
                Container(
                  margin: const EdgeInsets.all(AppDimensions.margin2XS),
                  child: Text(currentColor.value
                      .toRadixString(16)
                      .padLeft(6, '0')
                      .toUpperCase()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pickColor() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Pick a color'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: onColorChanged,
                hexInputBar: true,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  updateTextField();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
