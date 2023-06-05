import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

class DefaultOptionsCustomizationItem extends StatelessWidget {
  final List<String> options;
  final List<int>? defaultOptions;
  final bool isMultipleChoice;
  final ValueChanged<List<int>?> onChanged;

  const DefaultOptionsCustomizationItem({
    required this.options,
    required this.defaultOptions,
    required this.isMultipleChoice,
    required this.onChanged,
    super.key,
  });

  bool get _hasDefaultOptions => defaultOptions != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchCustomizationItem(
          initialValue: _hasDefaultOptions,
          title: context.localization.defaultOptions,
          onChanged: (isToggled) => onChanged(isToggled ? [0] : null),
        ),
        if (_hasDefaultOptions && options.isNotEmpty)
          isMultipleChoice
              ? _DefaultOptionsForMultipleChoice(
                  initialOptions: defaultOptions!,
                  options: options,
                  onChanged: onChanged,
                )
              : _DefaultOptionsForSingleChoice(
                  initialOption: defaultOptions!.first,
                  options: options,
                  onChanged: (selectedOption) => onChanged([selectedOption]),
                ),
      ],
    );
  }
}

class _DefaultOptionsForSingleChoice extends StatelessWidget {
  final int initialOption;
  final List<String> options;
  final ValueChanged<int> onChanged;

  const _DefaultOptionsForSingleChoice({
    required this.initialOption,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownCustomizationButton<int>(
      value: initialOption,
      items: options
          .mapIndexed(
            (index, option) => DropdownCustomizationItem(
              value: index,
              onChange: onChanged,
              child: Text(
                option,
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
          )
          .toList(),
      withColor: true,
    );
  }
}

class _DefaultOptionsForMultipleChoice extends StatelessWidget {
  final List<int> initialOptions;
  final List<String> options;
  final ValueChanged<List<int>?> onChanged;

  const _DefaultOptionsForMultipleChoice({
    required this.initialOptions,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...initialOptions.map(
          (optionIndex) => Option(
            option: options[optionIndex],
            onDelete: () {
              final newOptions = initialOptions
                  .where((e) => e != optionIndex)
                  .toList()
                ..sort();
              onChanged(newOptions);
            },
          ),
        ),
        DropdownCustomizationButton(
          value: -1,
          items: [
            DropdownCustomizationItem(
              value: -1,
              child: Text(
                context.localization.clickToSelectTheOption,
                style: const TextStyle(
                  color: AppColors.textHintGrey,
                ),
              ),
            ),
            ...options.mapIndexed(
              (index, option) => DropdownCustomizationItem(
                value: index,
                onChange: (selectedOption) {
                  final newOptions = List.of(initialOptions)
                    ..add(selectedOption)
                    ..sort();
                  onChanged(newOptions);
                },
                child: Text(
                  option,
                  style: context.theme.textTheme.bodyLarge,
                ),
              ),
            ).where((element) => !initialOptions.contains(element.value)),
          ],
          withColor: true,
        ),
      ],
    );
  }
}
