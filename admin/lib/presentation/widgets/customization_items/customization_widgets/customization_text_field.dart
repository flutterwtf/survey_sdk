import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_sdk/survey_sdk.dart';

class CustomizationTextField extends StatefulWidget {
  static const InputDecoration _defaultDecoration = InputDecoration(
    isCollapsed: true,
    border: InputBorder.none,
  );

  final String? initialValue;
  late final ValueChanged<String?>? onChanged;
  final double fontSize;
  late final List<TextInputFormatter>? inputFormatters;
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
  final bool _numberInput;

  //ignore:prefer_const_constructors_in_immutables
  CustomizationTextField({
    super.key,
    this.onChanged,
    this.initialValue,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.focusNode,
    this.onEditingComplete,
    this.controller,
    this.fontSize = SurveyFonts.sizeL,
    this.hintText,
    this.maxLines = 1,
    this.style,
    this.decoration = _defaultDecoration,
    this.textAlign = TextAlign.start,
  }) : _numberInput = false;

  CustomizationTextField.int({
    super.key,
    void Function(String?)? onChanged,
    this.initialValue,
    List<TextInputFormatter>? inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.focusNode,
    this.onEditingComplete,
    this.controller,
    this.fontSize = SurveyFonts.sizeL,
    this.hintText,
    this.maxLines = 1,
    this.style,
    this.decoration = _defaultDecoration,
    this.textAlign = TextAlign.start,
  }) : _numberInput = true {
    this.inputFormatters = [
      FilteringTextInputFormatter.digitsOnly,
      if (inputFormatters != null) ...inputFormatters,
    ];
    this.onChanged = (String? text) {
      if (text != null && text.isNotEmpty) {
        onChanged?.call(text);
      } else {
        onChanged?.call('0');
      }
    };
  }

  @override
  State<CustomizationTextField> createState() => _CustomizationTextFieldState();
}

class _CustomizationTextFieldState extends State<CustomizationTextField> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController(text: widget.initialValue);
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  @override
  void initState() {
    if (widget._numberInput) {
      _focusNode.addListener(_listenForFocus);
    }
    super.initState();
  }

  void _listenForFocus() {
    if (!_focusNode.hasFocus) {
      if (_controller.text.isEmpty) {
        setState(() => _controller.text = '0');
      }
    }
  }

  @override
  void dispose() {
    if (widget._numberInput) {
      _focusNode.removeListener(_listenForFocus);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlign,
      controller: _controller,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      focusNode: _focusNode,
      decoration: widget.decoration.copyWith(hintText: widget.hintText),
      style: widget.style ??
          context.theme.textTheme.bodyMedium
              ?.copyWith(fontSize: widget.fontSize),
      inputFormatters: widget.inputFormatters,
    );
  }
}
