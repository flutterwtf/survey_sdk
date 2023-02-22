import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class ColorPickerDialog extends StatelessWidget {
  final ValueChanged<Color> onColorPicked;
  final TextEditingController colorTextController;

  const ColorPickerDialog({
    Key? key,
    required this.onColorPicked,
    required this.colorTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick a color'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ColorPicker(
              pickerColor: colorFromHex(
                colorTextController.value.text,
                enableAlpha: true,
              )!,
              hexInputController: colorTextController,
              portraitOnly: true,
              onColorChanged: (_) {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppDimensions.margin2XS),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Hex'),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 75,
                    child: TextField(
                      controller: colorTextController,
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                        FilteringTextInputFormatter.allow(
                          RegExp(kValidHexPattern),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            onColorPicked(
              colorFromHex(
                colorTextController.value.text,
                enableAlpha: true,
              )!,
            );
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.sizeS,
              horizontal: AppDimensions.sizeM,
            ),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(
                AppDimensions.circularRadiusS,
              ),
            ),
            child: const Text(
              'OK',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
