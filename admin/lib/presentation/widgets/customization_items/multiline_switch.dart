import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_durations.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

class MultilineSwitch extends StatefulWidget {
  const MultilineSwitch({
    super.key,
    required this.onChanged,
    this.isMultiline = false,
    this.defaultLineAmount = 3,
  });

  /// if [isMultiline] equals `false` then [lineAmount] is always equals 1.
  /// In case of any input error [lineAmount] is always equals 1.
  final void Function(bool isMultiline, int lineAmount) onChanged;
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
        SwitchCustomizationItem(
          title: context.localization.multiline,
          onChanged: (isToggled) {
            setState(() {
              _isMultiline = isToggled;
            });
            widget.onChanged(_isMultiline, _isMultiline ? _lineAmount : 1);
          },
        ),
        AnimatedSize(
          duration: AppDurations.customizationItemAnimation,
          child: _isMultiline
              ? _LineAmountInputField(
                  defaultLineAmount: widget.defaultLineAmount,
                  onChanged: (amount) {
                    _lineAmount = amount;
                    widget.onChanged(_isMultiline, _lineAmount);
                  },
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

//TODO: combine with other input fields maybe?
class _LineAmountInputField extends StatelessWidget {
  const _LineAmountInputField({
    required this.onChanged,
    required this.defaultLineAmount,
  });

  final void Function(int amount) onChanged;
  final int defaultLineAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.marginM,
      ),
      child: Row(
        children: [
          Text(
            context.localization.lines,
            style: const TextStyle(
              fontSize: AppFonts.sizeM,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: CustomizationTextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              initialValue: defaultLineAmount.toString(),
              fontSize: AppFonts.sizeM,
              onChanged: (value) {
                if (value == null) {
                  onChanged(1);
                } else {
                  onChanged(int.tryParse(value) ?? 1);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
