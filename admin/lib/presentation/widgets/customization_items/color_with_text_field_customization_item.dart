import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

// TODO use a better name?
class ColorWithTextFieldCustomizationItem extends StatelessWidget {
  final Color? initialColor;
  final ValueChanged<Color> onColorPicked;
  final String initialText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?> onTextChanged;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextEditingController? textEditingController;
  final double? fontSize;
  final InputDecoration? decoration;

  const ColorWithTextFieldCustomizationItem({
    super.key,
    this.initialColor,
    required this.onColorPicked,
    required this.initialText,
    this.inputFormatters,
    required this.onTextChanged,
    this.focusNode,
    this.onEditingComplete,
    this.textEditingController,
    this.fontSize,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ColorCustomizationItem(
            initialColor: initialColor ?? AppColors.black,
            onColorPicked: onColorPicked,
          ),
        ),
        Flexible(
          child: CustomizationTextField(
            onChanged: onTextChanged,
            initialValue: initialText,
            inputFormatters: inputFormatters,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            controller: textEditingController,
            fontSize: fontSize ?? AppFonts.sizeL,
            decoration: decoration ??
                const InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                ),
          ),
        ),
      ],
    );
  }
}
