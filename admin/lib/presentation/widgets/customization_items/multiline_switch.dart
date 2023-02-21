import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

class MultilineSwitch extends StatefulWidget {
  const MultilineSwitch({
    super.key,
    required this.onChanged,
    this.isMultiline = false,
    this.defaultLineAmount = 3,
  });

  /// if `isMultiline` equals `false` then `lineAmount` is always equals 1.
  /// In case of any input error `lineAmount` is always equals 1.
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
          //TODO: move to localization maaybe?
          title: 'Multiline',
          onChanged: (isToggled) {
            setState(() {
              _isMultiline = isToggled;
            });
            widget.onChanged(_isMultiline, _isMultiline ? _lineAmount : 1);
          },
        ),
        AnimatedSize(
          //TODO: move to const maybe?
          duration: const Duration(
            milliseconds: 100,
          ),
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
    return FormBuilder(
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppDimensions.marginM,
        ),
        child: Row(
          children: [
            const Text(
              'Lines ',
              style: TextStyle(
                fontSize: AppFonts.sizeM,
                color: AppColors.black,
              ),
            ),
            Expanded(
              child: CustomizationTextField(
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
      ),
    );
  }
}
