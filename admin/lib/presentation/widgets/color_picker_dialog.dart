import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';

class ColorPickerDialog extends StatelessWidget {
  final ValueChanged<Color> onColorPicked;
  final TextEditingController colorTextController;
  final VoidCallback onClose;

  const ColorPickerDialog({
    required this.onColorPicked,
    required this.colorTextController,
    required this.onClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        context.localization.pick_a_color,
      ),
      // TODO(dev): Maybe ListView here?
      content: SingleChildScrollView(
        child: Column(
          children: [
            ColorPicker(
              pickerColor: colorFromHex(colorTextController.value.text)!,
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
                  const SizedBox(width: AppDimensions.marginXS),
                  SizedBox(
                    width: AppDimensions.textFieldWidth,
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
            onClose.call();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.sizeS,
              horizontal: AppDimensions.sizeM,
            ),
            decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(AppDimensions.circularRadiusS),
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
