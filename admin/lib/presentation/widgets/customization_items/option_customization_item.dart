import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_sdk/survey_sdk.dart';

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
    if (_controller.text.isNotEmpty) {
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
          (option) => _Option(
            option: option,
            delete: () => _delete(option),
          ),
        ),
        const SizedBox(height: SurveyDimensions.sizeS),
        Row(
          children: [
            const Icon(
              Icons.fiber_manual_record,
              size: SurveyDimensions.sizeS,
              color: SurveyColors.textLightGrey,
            ),
            const SizedBox(width: SurveyDimensions.margin2XS),
            Expanded(
              child: CustomizationTextField(
                controller: _controller,
                onEditingComplete: _onEditingComplete,
                decoration: InputDecoration.collapsed(
                  hintText: context.localization.typeNewOptionHere,
                  hintStyle: const TextStyle(
                    color: SurveyColors.textHintGrey,
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

class _Option extends StatelessWidget {
  final String option;
  final VoidCallback delete;

  const _Option({
    required this.option,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.fiber_manual_record,
          size: SurveyDimensions.sizeS,
        ),
        const SizedBox(width: SurveyDimensions.margin2XS),
        Expanded(
          child: Text(
            option,
            style: context.theme.textTheme.bodyLarge,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.close,
            size: SurveyDimensions.sizeM,
          ),
          onPressed: delete,
        ),
      ],
    );
  }
}
