import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class PaddingCustomizationItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    const lengthInputFormatter = 3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _PaddingItem(isHorizontal: true),
        Flexible(
          child: CustomizationTextField(
            initialValue: initialHorizontalPadding.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(lengthInputFormatter),
            ],
            onChanged: (value) => SizeHandler.onDoubleSizeChanged(
              value,
              onHorizontalPaddingChange,
            ),
          ),
        ),
        const _PaddingItem(isHorizontal: false),
        Flexible(
          child: CustomizationTextField(
            initialValue: initialVerticalPadding.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(lengthInputFormatter),
            ],
            onChanged: (value) => SizeHandler.onDoubleSizeChanged(
              value,
              onVerticalPaddingChange,
            ),
          ),
        ),
      ],
    );
  }
}

class _PaddingItem extends StatelessWidget {
  final bool isHorizontal;

  const _PaddingItem({required this.isHorizontal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppDimensions.sizeS),
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
    );
  }
}
