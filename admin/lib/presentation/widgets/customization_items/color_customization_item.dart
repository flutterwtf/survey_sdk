import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class ColorCustomizationItem extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;

  const ColorCustomizationItem({
    required this.initialColor,
    required this.onColorPicked,
    super.key,
  });

  @override
  State<ColorCustomizationItem> createState() => _ColorCustomizationItemState();
}

class _ColorCustomizationItemState extends State<ColorCustomizationItem> {
  late Color _pickedColor;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isPickerOpened = false;
  final _pickerAreaHeightPercent = 0.4;
  final _lengthLimit = 8;
  final _radix = 16;
  late OverlayEntry _overlayEntry;
  late OverlayState _overlayState;

  @override
  void initState() {
    super.initState();
    _controller.text = _colorToString(widget.initialColor);
    _pickedColor = widget.initialColor;
    _focusNode.addListener(_complete);
  }

  void _onChanged(String? value) {
    if (value != null) {
      final color = int.tryParse(value.padRight(8, '0'), radix: 16);
      if (color != null) {
        widget.onColorPicked(Color(color));
        setState(() => _pickedColor = Color(color));
      }
    }
  }

  void _onColorChanged(Color color) {
    widget.onColorPicked(color);
    setState(() {
      _pickedColor = color;
      _controller.text = _colorToString(color);
    });
  }

  void _complete() {
    if (!_focusNode.hasFocus) {
      _controller
        ..text = _colorToString(_pickedColor)
        ..selection = TextSelection.collapsed(
          offset: _controller.text.length,
        );
    }
  }

  String _colorToString(Color color) =>
      color.value.toRadixString(_radix).toUpperCase().padRight(
            _lengthLimit,
            '0',
          );

  OverlayEntry _colorPickerEntry(Offset pos) {
    final height = MediaQuery.of(context).size.height;
    const colorPickerHeight =
        AppDimensions.surveyEditorBarWidth - AppDimensions.marginL;
    final top = pos.dy + colorPickerHeight + AppDimensions.marginXS > height
        ? pos.dy - colorPickerHeight + AppDimensions.marginXS
        : pos.dy + AppDimensions.marginXS;
    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: top,
              left: pos.dx + AppDimensions.marginXS,
              width:
                  AppDimensions.surveyEditorBarWidth - AppDimensions.margin4XL,
              height: colorPickerHeight,
              child: Material(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.whitePrimaryBackground,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyBackground,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ColorPicker(
                    pickerColor: _pickedColor,
                    onColorChanged: _onColorChanged,
                    portraitOnly: true,
                    pickerAreaHeightPercent: _pickerAreaHeightPercent,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: GestureDetector(
                onTap: _hideColorPicker,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showColorPicker() {
    final renderBox = context.findRenderObject() as RenderBox?;
    final pos = renderBox!.localToGlobal(Offset.zero);
    _overlayState = Overlay.of(context);
    _overlayEntry = _colorPickerEntry(pos);
    if (!_isPickerOpened) {
      _overlayState.insert(_overlayEntry);
      setState(() => _isPickerOpened = true);
    }
  }

  void _hideColorPicker() {
    if (_isPickerOpened) {
      _overlayEntry.remove();
      setState(() => _isPickerOpened = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_complete);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: _showColorPicker,
              child: Container(
                decoration: BoxDecoration(
                  color: _pickedColor,
                  border: const Border.fromBorderSide(
                    BorderSide(color: AppColors.greyBackground),
                  ),
                ),
                width: AppDimensions.sizeM,
                height: AppDimensions.sizeM,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(AppDimensions.margin2XS),
                child: CustomizationTextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  inputFormatters: [
                    // TODO(dev): move input formatters?
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9a-fA-F]'),
                    ),
                    LengthLimitingTextInputFormatter(_lengthLimit),
                  ],
                  onChanged: _onChanged,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
