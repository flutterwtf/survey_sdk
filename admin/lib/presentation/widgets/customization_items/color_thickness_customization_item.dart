import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/double_input_formatter.dart';
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
    //It is not null anyway because of formatter
    final textFieldText = text!;
    final textToParse = textFieldText[textFieldText.length - 1] == '.'
        ? textFieldText.characters
            .getRange(0, textFieldText.length - 1)
            .toString()
        : textFieldText;
    final thickness = double.tryParse(textToParse) ?? 0;
    widget.onThicknessChanged(thickness);
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
          child: Padding(
            padding: const EdgeInsets.only(right: AppDimensions.margin5XL),
            child: CustomizationTextField(
              controller: _controller,
              inputFormatters: [
                DoubleInputFormatter(),
              ],
              onChanged: _onThicknessChanged,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                suffix: Padding(
                  padding: const EdgeInsets.only(left: AppDimensions.margin2XS),
                  child: Text(
                    context.localization.px,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ),
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
