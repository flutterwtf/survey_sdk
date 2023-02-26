import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';

class MinMaxCustomizationItem extends StatefulWidget {
  final int initialMin;
  final int initialMax;
  final void Function(int? min, int? max) onChanged;

  const MinMaxCustomizationItem({
    super.key,
    this.initialMin = 0,
    this.initialMax = 10,
    required this.onChanged,
  }) : assert(initialMax > initialMin);

  @override
  State<MinMaxCustomizationItem> createState() =>
      _MinMaxCustomizationItemState();
}

class _MinMaxCustomizationItemState extends State<MinMaxCustomizationItem> {
  int? _min;
  int? _max;

  @override
  void initState() {
    super.initState();
    _min = widget.initialMin;
    _max = widget.initialMax;
  }

  bool _canCallParentOnChanged() {
    if (_min != null && _max != null) {
      return _min! < _max!;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _MinMaxInputField(
              name: 'min_input_field',
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
            flex: 3,
            child: _MinMaxInputField(
              name: 'max_input_field',
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
      ),
    );
  }
}

//TODO: combine with default input field
class _MinMaxInputField extends StatelessWidget {
  final String name;
  final String prefix;
  final int initialValue;
  final int? minValue;
  final int? maxValue;
  final void Function(int? value) onChanged;

  const _MinMaxInputField({
    required this.name,
    required this.prefix,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  String? _validator(String? value) {
    if (value == null) return null;

    final inputNumber = int.tryParse(value);
    if (inputNumber == null) return null;

    if (minValue != null) {
      return inputNumber < minValue! ? '$prefix > $minValue' : null;
    }
    if (maxValue != null) {
      return inputNumber > maxValue! ? '$prefix < $maxValue' : null;
    }

    return null;
  }

  void _onChanged(String? value) {
    if (value != null) {
      onChanged(int.tryParse(value));
    } else {
      onChanged(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: AppDimensions.marginXS,
          ),
          child: Text(
            prefix,
            style: const TextStyle(
              fontSize: AppFonts.sizeL,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
        ),
        Expanded(
          child: CustomizationTextField(
            name: name,
            initialValue: initialValue.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _validator,
            onChanged: _onChanged,
          ),
        ),
      ],
    );
  }
}
