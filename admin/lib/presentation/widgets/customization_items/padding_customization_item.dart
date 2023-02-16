import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';

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
    Key? key,
  }) : super(key: key);

  @override
  State<PaddingCustomizationItem> createState() => _PaddingCustomizationItemState();
}

class _PaddingCustomizationItemState extends State<PaddingCustomizationItem> {
  final horizontalPaddingFocusNode = FocusNode();
  final verticalPaddingFocusNode = FocusNode();
  late double horizontalPadding;
  late double verticalPadding;

  @override
  void initState() {
    horizontalPadding = widget.initialHorizontalPadding;
    verticalPadding = widget.initialVerticalPadding;
    horizontalPaddingFocusNode.addListener(() {
      if (!horizontalPaddingFocusNode.hasFocus) {
        widget.onHorizontalPaddingChange(horizontalPadding);
      }
    });
    verticalPaddingFocusNode.addListener(() {
      if (!verticalPaddingFocusNode.hasFocus) {
        widget.onVerticalPaddingChange(verticalPadding);
      }
    });
    super.initState();
  }

  //TODO: split to widgets please
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.marginM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1.0,
                        color: AppColors.black,
                      ),
                    ),
                    color: AppColors.white,
                  ),
                  width: AppDimensions.sizeM,
                  height: AppDimensions.sizeM,
                ),
                Container(
                  margin: const EdgeInsets.only(left: AppDimensions.marginS),
                  width: AppDimensions.sizeL,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    focusNode: horizontalPaddingFocusNode,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    initialValue: horizontalPadding.toString(),
                    onChanged: (value) => setState(() => horizontalPadding = double.parse(value)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(
                        width: 1.0,
                        color: AppColors.black,
                      ),
                    ),
                    color: AppColors.white,
                  ),
                  width: AppDimensions.sizeM,
                  height: AppDimensions.sizeM,
                ),
                Container(
                  margin: const EdgeInsets.only(left: AppDimensions.marginS),
                  width: AppDimensions.sizeL,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    focusNode: verticalPaddingFocusNode,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    initialValue: verticalPadding.toString(),
                    onChanged: (value) => setState(() => verticalPadding = double.parse(value)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
