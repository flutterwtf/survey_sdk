import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option.dart';

class OptionCustomizationItem extends StatefulWidget {
  final List<String> options;
  final void Function(List<String>, int) onChanged;
  final int ruleValue;

  const OptionCustomizationItem({
    required this.options,
    required this.onChanged,
    required this.ruleValue,
    super.key,
  });

  @override
  State<OptionCustomizationItem> createState() =>
      _OptionCustomizationItemState();
}

class _OptionCustomizationItemState extends State<OptionCustomizationItem> {
  final TextEditingController _controller = TextEditingController();
  List<String> _options = [];

  @override
  void initState() {
    super.initState();

    _options = widget.options;
  }

  void _onEditingComplete() {
    if (_controller.text.isNotEmpty && !_options.contains(_controller.text)) {
      setState(() => _options = [..._options, _controller.text]);
    }

    _controller.clear();
    widget.onChanged(_options, widget.ruleValue);
  }

  void _delete(String option) {
    final ruleValue =
        widget.ruleValue == _options.length ? 0 : widget.ruleValue;
    final newOptions = List.of(_options)..remove(option);
    setState(() {
      _options = newOptions;
    });
    widget.onChanged(newOptions, ruleValue);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._options.map(
          (option) => Option(
            option: option,
            onDelete: () => _delete(option),
          ),
        ),
        const SizedBox(height: AppDimensions.sizeS),
        Row(
          children: [
            const Icon(
              Icons.fiber_manual_record,
              size: AppDimensions.sizeS,
              color: AppColors.textLightGrey,
            ),
            const SizedBox(width: AppDimensions.margin2XS),
            Expanded(
              child: CustomizationTextField(
                controller: _controller,
                onEditingComplete: _onEditingComplete,
                decoration: InputDecoration.collapsed(
                  hintText: context.localization.typeNewOptionHere,
                  hintStyle: const TextStyle(
                    color: AppColors.textHintGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
