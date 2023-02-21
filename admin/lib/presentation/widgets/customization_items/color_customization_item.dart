import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

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

  void onColorChanged(color) {
    widget.onColorPicked(color);
    setState(() => _pickedColor = color);
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
    return GestureDetector(
      onTap: pickColor,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.black,
              ),
              color: _pickedColor,
            ),
            width: AppDimensions.sizeM,
            height: AppDimensions.sizeM,
          ),
          Padding(
            padding: const EdgeInsets.all(
              AppDimensions.margin2XS,
            ),
            child: Text(
              _pickedColor.value
                  .toRadixString(16)
                  .padLeft(6, '0')
                  .toUpperCase(),
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
              pickerColor: _pickedColor,
              onColorChanged: onColorChanged,
              hexInputBar: true,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(context.localization.ok),
              onPressed: () {
                updateTextField();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
