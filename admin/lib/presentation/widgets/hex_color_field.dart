import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class HexColorField extends StatelessWidget {
  final TextEditingController colorTextController;
  final ValueChanged<Color> onColorPicked;

  const HexColorField({
    required this.colorTextController,
    required this.onColorPicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(AppDimensions.margin2XS),
        child: TextField(
          controller: colorTextController,
          style: const TextStyle(fontSize: AppFonts.sizeL),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          inputFormatters: [
            UpperCaseTextFormatter(),
            FilteringTextInputFormatter.allow(RegExp(kValidHexPattern)),
          ],
          onChanged: (str) => onColorPicked(
            colorFromHex(
              str,
            )!,
          ),
        ), //
      ),
    );
  }
}
