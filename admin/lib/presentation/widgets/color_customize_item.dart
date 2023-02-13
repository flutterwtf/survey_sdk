import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';

class ColorCustomizeItem extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;

  const ColorCustomizeItem({
    required this.initialColor,
    required this.onColorPicked,
    Key? key,
  }) : super(key: key);

  @override
  State<ColorCustomizeItem> createState() => _ColorCustomizeItemState();
}

class _ColorCustomizeItemState extends State<ColorCustomizeItem> {
  late Color pickerColor;
  late Color currentColor;

  @override
  void initState() {
    currentColor = widget.initialColor;
    pickerColor = currentColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.marginM),
      child: GestureDetector(
        onTap: pickColor,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(AppDimensions.margin2XS),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                color: currentColor,
              ),
              width: AppDimensions.sizeM,
              height: AppDimensions.sizeM,
            ),
            Container(
              margin: const EdgeInsets.all(AppDimensions.margin2XS),
              child: Text(currentColor.value.toRadixString(16).padLeft(6, '0').toUpperCase()),
            ),
          ],
        ),
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
                onColorChanged: (color) {
                  widget.onColorPicked(color);
                  setState(() => pickerColor = color);
                },
                hexInputBar: true,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
