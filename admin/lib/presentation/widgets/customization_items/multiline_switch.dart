import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';
import 'package:survey_sdk/survey_sdk.dart';

class MultilineSwitch extends StatefulWidget {
  const MultilineSwitch({
    required this.value,
    required this.onChanged,
    required this.lines,
    super.key,
  });

  /// If [value] equals `false` then `lineAmount` is always equals 1.
  /// In case of any input error `lineAmount` is always equals 1.
  final void Function({
    required bool isMultiline,
    required int lineAmount,
  }) onChanged;
  final bool value;
  final int lines;

  @override
  State<MultilineSwitch> createState() => _MultilineSwitchState();
}

class _MultilineSwitchState extends State<MultilineSwitch> {
  late bool _isMultiline;
  late int _lineAmount;

  @override
  void initState() {
    super.initState();
    _isMultiline = widget.value;
    _lineAmount = widget.lines;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: SurveyDimensions.marginS),
          child: SwitchCustomizationItem(
            initialValue: _isMultiline,
            title: context.localization.multiline,
            onChanged: (isToggled) {
              setState(() => _isMultiline = isToggled);
              widget.onChanged(
                isMultiline: _isMultiline,
                lineAmount: _isMultiline ? _lineAmount : 1,
              );
            },
          ),
        ),
        AnimatedSize(
          duration: SurveyDurations.customizationItemDuration,
          child: _isMultiline
              ? _LineAmountInputField(
                  defaultLineAmount: widget.lines,
                  onChanged: (amount) {
                    _lineAmount = max(amount, 1);
                    widget.onChanged(
                      isMultiline: _isMultiline,
                      lineAmount: _lineAmount,
                    );
                  },
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _LineAmountInputField extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int defaultLineAmount;

  const _LineAmountInputField({
    required this.onChanged,
    required this.defaultLineAmount,
  });

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 3;
    return Padding(
      padding: const EdgeInsets.only(
        top: SurveyDimensions.marginM,
      ),
      child: Row(
        children: [
          Text(
            '${context.localization.lines}:',
            style: context.theme.textTheme.bodyMedium,
          ),
          const SizedBox(width: SurveyDimensions.margin2XS),
          Expanded(
            child: CustomizationTextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(lengthInputFormatter),
              ],
              initialValue: defaultLineAmount.toString(),
              fontSize: SurveyFonts.sizeM,
              onChanged: (value) => value == null
                  ? onChanged(1)
                  : onChanged(int.tryParse(value) ?? 1),
            ),
          ),
        ],
      ),
    );
  }
}
