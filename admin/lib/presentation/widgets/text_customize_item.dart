import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';
import 'package:survey_sdk/presentation/widgets/color_picker_dialog.dart';
import 'package:survey_sdk/presentation/widgets/customization_title.dart';
import 'package:survey_sdk/presentation/widgets/hex_color_field.dart';
import 'package:survey_sdk/presentation/widgets/text_width_field.dart';

class TextCustomizeItem extends StatefulWidget {
  final String title;
  final int initialTextWidth;
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;
  final ValueChanged<int> onTextWidthPicked;

  const TextCustomizeItem({
    required this.title,
    required this.initialTextWidth,
    required this.initialColor,
    required this.onColorPicked,
    required this.onTextWidthPicked,
    Key? key,
  }) : super(key: key);

  @override
  State<TextCustomizeItem> createState() => _TextCustomizeItemState();
}

class _TextCustomizeItemState extends State<TextCustomizeItem> {
  late TextEditingController colorTextController;
  late TextEditingController textWidthTextController;

  @override
  void initState() {
    colorTextController = TextEditingController(
      text: widget.initialColor.value.toRadixString(16).padLeft(6, '0').toUpperCase(),
    );
    textWidthTextController = TextEditingController(text: widget.initialTextWidth.toString());
    super.initState();
  }

  @override
  void dispose() {
    colorTextController.dispose();
    textWidthTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.marginM),
      child: Column(
        children: [
          CustomizationTitle(title: widget.title),
          Row(
            children: [
              GestureDetector(
                onTap: () => pickColor(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorFromHex(colorTextController.value.text, enableAlpha: true)!,
                  ),
                  width: AppDimensions.sizeM,
                  height: AppDimensions.sizeM,
                ),
              ),
              HexColorField(
                colorTextController: colorTextController,
                onColorPicked: (color) {
                  setState(
                    () => widget.onColorPicked(color),
                  );
                },
              ),
              const SizedBox(width: AppDimensions.sizeM),
              TextWidthField(
                textWidthTextController: textWidthTextController,
                onTextWidthPicked: (textWidth) => widget.onTextWidthPicked(textWidth),
              )
            ],
          ),
        ],
      ),
    );
  }

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          onColorPicked: (color) {
            setState(() {
              widget.onColorPicked(color);
            });
          },
          colorTextController: colorTextController,
        );
      },
    );
  }
}
