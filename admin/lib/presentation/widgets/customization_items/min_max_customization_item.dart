import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/size_handler.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

const _minValue = 0;
const _maxValue = 10;

class MinMaxCustomizationItem extends StatefulWidget {
  final int initialMin;
  final int initialMax;
  final void Function(int min, int max) onChanged;

  const MinMaxCustomizationItem({
    required this.onChanged,
    this.initialMin = _minValue,
    this.initialMax = _maxValue,
    super.key,
  }) : assert(
          initialMax > initialMin,
          'initialMax must be greater then initialMin',
        );

  @override
  State<MinMaxCustomizationItem> createState() =>
      _MinMaxCustomizationItemState();
}

class _MinMaxCustomizationItemState extends State<MinMaxCustomizationItem> {
  late int _min;
  late int _max;

  @override
  void initState() {
    super.initState();
    _min = widget.initialMin;
    _max = widget.initialMax;
  }

  bool _canCallParentOnChanged() => _min < _max;

  @override
  Widget build(BuildContext context) {
    const minFlex = 2;
    const maxFlex = 3;
    return Row(
      children: [
        Expanded(
          flex: minFlex,
          child: _MinMaxInputField(
            prefix: context.localization.min,
            initialValue: widget.initialMin,
            minValue: null,
            maxValue: _max,
            onChanged: (value) {
              setState(() => _min = value);
              if (_canCallParentOnChanged()) {
                widget.onChanged(_min, _max);
              }
            },
          ),
        ),
        Expanded(
          flex: maxFlex,
          child: _MinMaxInputField(
            prefix: context.localization.max,
            initialValue: widget.initialMax,
            minValue: _min,
            maxValue: null,
            onChanged: (value) {
              setState(() => _max = value);
              if (_canCallParentOnChanged()) {
                widget.onChanged(_min, _max);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _MinMaxInputField extends StatelessWidget {
  final String prefix;
  final int initialValue;
  final int? minValue;
  final int? maxValue;
  final void Function(int value) onChanged;

  const _MinMaxInputField({
    required this.prefix,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  String? _validator(String? value) {
    final inputNumber = int.tryParse(value ?? '');

    if (inputNumber != null) {
      if (minValue != null) {
        return inputNumber < minValue! ? '$prefix > $minValue' : null;
      }
      if (maxValue != null) {
        return inputNumber > maxValue! ? '$prefix < $maxValue' : null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const lengthInputFormatter = 6;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: AppDimensions.marginXS,
          ),
          child: Text(
            prefix,
            style: context.theme.textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: CustomizationTextField(
            initialValue: initialValue.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(lengthInputFormatter),
            ],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _validator,
            onChanged: (value) => SizeHandler.onSizeChanged(value, onChanged),
          ),
        ),
      ],
    );
  }
}
