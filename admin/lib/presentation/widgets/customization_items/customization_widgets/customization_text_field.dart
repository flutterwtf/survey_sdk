import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/utils.dart';

class CustomizationTextField extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final double fontSize;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;
  final AutovalidateMode autovalidateMode;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;
  final InputDecoration decoration;
  final String? hintText;
  final int? maxLines;
  final TextStyle? style;
  final TextAlign textAlign;

  const CustomizationTextField({
    super.key,
    this.onChanged,
    this.initialValue,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.focusNode,
    this.onEditingComplete,
    this.controller,
    this.fontSize = AppFonts.sizeL,
    this.hintText,
    this.maxLines = 1,
    this.style,
    this.decoration = const InputDecoration(
      isCollapsed: true,
      border: InputBorder.none,
    ),
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      autovalidateMode: autovalidateMode,
      maxLines: maxLines,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      decoration: decoration.copyWith(hintText: hintText),
      style: style ??
          context.theme.textTheme.bodyMedium?.copyWith(fontSize: fontSize),
      inputFormatters: inputFormatters,
    );
  }
}
