import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

const _lineAmount = 3;

class MultilineSwitch extends StatefulWidget {
  const MultilineSwitch({
    required this.onChanged,
    this.isMultiline = false,
    this.defaultLineAmount = _lineAmount,
    super.key,
  });

  /// If [isMultiline] equals `false` then `lineAmount` is always equals 1.
  /// In case of any input error `lineAmount` is always equals 1.
  final void Function({
    required bool isMultiline,
    required int lineAmount,
  }) onChanged;
  final bool isMultiline;
  final int defaultLineAmount;

  @override
  State<MultilineSwitch> createState() => _MultilineSwitchState();
}

class _MultilineSwitchState extends State<MultilineSwitch> {
  late bool _isMultiline;
  late int _lineAmount;

  @override
  void initState() {
    super.initState();

    _isMultiline = widget.isMultiline;
    _lineAmount = widget.defaultLineAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppDimensions.marginS),
          child: SwitchCustomizationItem(
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
          duration: AppDurations.customizationItem,
          child: _isMultiline
              ? _LineAmountInputField(
                  defaultLineAmount: widget.defaultLineAmount,
                  onChanged: (amount) {
                    _lineAmount = amount;
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
        top: AppDimensions.marginM,
      ),
      child: Row(
        children: [
          Text(
            context.localization.lines,
            style: context.theme.textTheme.bodyMedium,
          ),
          const SizedBox(width: AppDimensions.margin2XS),
          Expanded(
            child: CustomizationTextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(lengthInputFormatter),
              ],
              initialValue: defaultLineAmount.toString(),
              fontSize: AppFonts.sizeM,
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
