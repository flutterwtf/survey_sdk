import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class PaddingCustomizationItem extends StatefulWidget {
  final double initialHorizontalPadding;
  final double initialVerticalPadding;
  final ValueChanged<double> onHorizontalPaddingChange;
  final ValueChanged<double> onVerticalPaddingChange;

  const PaddingCustomizationItem({
    required this.initialHorizontalPadding,
    required this.initialVerticalPadding,
    required this.onHorizontalPaddingChange,
    required this.onVerticalPaddingChange,
    super.key,
  });

  @override
  State<PaddingCustomizationItem> createState() =>
      _PaddingCustomizationItemState();
}

// TODO(dev): we can make this widget better.
class _PaddingCustomizationItemState extends State<PaddingCustomizationItem> {
  final horizontalPaddingFocus = FocusNode();
  final verticalPaddingFocus = FocusNode();
  late double horizontalPadding;
  late double verticalPadding;

  @override
  void initState() {
    super.initState();

    horizontalPadding = widget.initialHorizontalPadding;
    verticalPadding = widget.initialVerticalPadding;
    horizontalPaddingFocus.addListener(() {
      if (!horizontalPaddingFocus.hasFocus) {
        widget.onHorizontalPaddingChange(horizontalPadding);
      }
    });
    verticalPaddingFocus.addListener(() {
      if (!verticalPaddingFocus.hasFocus) {
        widget.onVerticalPaddingChange(verticalPadding);
      }
    });
  }

  @override
  void dispose() {
    horizontalPaddingFocus.dispose();
    verticalPaddingFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _PaddingItem(
          isHorizontal: true,
          focusNode: horizontalPaddingFocus,
          initialValue: horizontalPadding.toString(),
          onChanged: (value) =>
              setState(() => horizontalPadding = double.parse(value)),
        ),
        _PaddingItem(
          isHorizontal: false,
          focusNode: verticalPaddingFocus,
          initialValue: verticalPadding.toString(),
          onChanged: (value) =>
              setState(() => verticalPadding = double.parse(value)),
        ),
      ],
    );
  }
}

class _PaddingItem extends StatelessWidget {
  final bool isHorizontal;
  final FocusNode focusNode;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const _PaddingItem({
    required this.focusNode,
    required this.initialValue,
    required this.onChanged,
    required this.isHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 3;
    return Expanded(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: isHorizontal
                  ? const Border.symmetric(
                      horizontal: BorderSide(),
                    )
                  : const Border.symmetric(
                      vertical: BorderSide(),
                    ),
              color: AppColors.white,
            ),
            width: AppDimensions.sizeM,
            height: AppDimensions.sizeM,
          ),
          Container(
            margin: const EdgeInsets.only(left: AppDimensions.marginXS),
            width: AppDimensions.sizeXL,
            child: CustomizationTextField(
              focusNode: focusNode,
              initialValue: initialValue,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(lengthInputFormatter),
              ],
              onChanged: (value) {
                if (value != null) onChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
