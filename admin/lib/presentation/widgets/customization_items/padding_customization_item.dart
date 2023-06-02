import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';
import 'package:survey_sdk/survey_sdk.dart';

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
          child: CustomizationTextField.int(
            initialValue: initialHorizontalPadding.toString(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(lengthInputFormatter),
            ],
            onChanged: (value) =>
                onHorizontalPaddingChange(double.parse(value!)),
          ),
        ),
        const _PaddingItem(isHorizontal: false),
        Flexible(
          child: CustomizationTextField.int(
            initialValue: initialVerticalPadding.toString(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(lengthInputFormatter),
            ],
            onChanged: (value) => onVerticalPaddingChange(double.parse(value!)),
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
    return Padding(
      padding: const EdgeInsets.only(right: SurveyDimensions.sizeS),
      child: VectorImage(
        assetName: isHorizontal
            ? AppAssets.paddingHorizontalIcon
            : AppAssets.paddingVerticalIcon,
      ),
    );
  }
}
