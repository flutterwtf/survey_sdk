import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class ColorPickerDialog extends StatelessWidget {
  final ValueChanged<Color> onColorPicked;
  final TextEditingController colorTextController;

  const ColorPickerDialog({
    super.key,
    required this.onColorPicked,
    required this.colorTextController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        context.localization.pick_a_color,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ColorPicker(
              pickerColor: colorFromHex(
                colorTextController.value.text,
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
                  Text(context.localization.hex),
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
            child: Text(
              context.localization.ok,
              style: const TextStyle(color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
