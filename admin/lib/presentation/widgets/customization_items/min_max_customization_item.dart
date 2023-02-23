import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';

class MinMaxCustomizationItem extends StatefulWidget {
  const MinMaxCustomizationItem({
    super.key,
    this.initialMin = 0,
    this.initialMax = 10,
    required this.onChanged,
  });

  final int initialMin;
  final int initialMax;
  final void Function(int? min, int? max) onChanged;

  @override
  State<MinMaxCustomizationItem> createState() => _MinMaxCustomizationItemState();
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

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _MinMaxInputField(
              prefix: context.localization.min,
              initialValue: widget.initialMin,
              onChanged: (value) {
                _min = value;
                widget.onChanged(_min, _max);
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: _MinMaxInputField(
              prefix: context.localization.max,
              initialValue: widget.initialMax,
              onChanged: (value) {
                _max = value;
                widget.onChanged(_min, _max);
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
  const _MinMaxInputField({
    required this.prefix,
    required this.initialValue,
    required this.onChanged,
  });

  final String prefix;
  final int initialValue;
  final void Function(int? value) onChanged;

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
            initialValue: initialValue.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
            onChanged: (value) {
              if (value != null) {
                onChanged(int.tryParse(value));
              } else {
                onChanged(null);
              }
            },
          ),
        ),
      ],
    );
  }
}
