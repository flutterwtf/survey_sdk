import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class ColorThicknessCustomizationItem extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorPicked;
  final double initialThickness;
  final ValueChanged<double> onThicknessChanged;

  const ColorThicknessCustomizationItem({
    required this.initialColor,
    required this.onColorPicked,
    required this.initialThickness,
    required this.onThicknessChanged,
    super.key,
  });

  @override
  State<ColorThicknessCustomizationItem> createState() =>
      _ColorThicknessCustomizationItemState();
}

class _ColorThicknessCustomizationItemState
    extends State<ColorThicknessCustomizationItem> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialThickness.toString();
    super.initState();
  }

  void _onThicknessChanged(String? text) {
    final thickness = double.tryParse(text ?? '') ?? 0;
    widget.onThicknessChanged(thickness);
    setState(() => _controller.text = thickness.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColorCustomizationItem(
            initialColor: widget.initialColor,
            onColorPicked: widget.onColorPicked,
          ),
        ),
        Expanded(
          child: CustomizationTextField(
            controller: _controller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'^(\d+){0,2}?\.?\d{0,2}'),
              ),
            ],
            onChanged: _onThicknessChanged,
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              suffixText: context.localization.px,
              suffixStyle: context.theme.textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
