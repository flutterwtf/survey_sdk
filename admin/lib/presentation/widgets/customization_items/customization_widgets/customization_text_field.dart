import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

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

  const CustomizationTextField({
    Key? key,
    this.onChanged,
    this.initialValue,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.focusNode,
    this.onEditingComplete,
    this.controller,
    this.fontSize = AppFonts.sizeL,
    this.decoration = const InputDecoration(
      isCollapsed: true,
      border: InputBorder.none,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      decoration: decoration,
      style: context.theme.textTheme.bodyMedium?.copyWith(fontSize: fontSize),
      inputFormatters: inputFormatters,
    );
  }
}
