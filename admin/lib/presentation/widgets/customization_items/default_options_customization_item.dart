import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

class DefaultOptionsCustomizationItem extends StatelessWidget {
  final List<String> options;
  final List<String>? defaultOptions;
  final bool isMultipleChoice;
  final ValueChanged<List<String>?> onChanged;

  const DefaultOptionsCustomizationItem({
    required this.options,
    required this.defaultOptions,
    required this.isMultipleChoice,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchCustomizationItem(
          initialValue: defaultOptions != null,
          title: context.localization.defaultOptions,
          onChanged: (isToggled) => onChanged(
            isToggled ? [options.first] : null,
          ),
        ),
        if (defaultOptions != null && options.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.sizeS),
          if (isMultipleChoice)
            _DefaultOptionsForMultipleChoice(
              defaultOptions: defaultOptions!,
              options: options,
              onChanged: onChanged,
            )
          else
            _DefaultOptionsForSingleChoice(
              defaultOption: defaultOptions!.first,
              options: options,
              onChanged: (selectedOption) => onChanged([selectedOption]),
            ),
        ],
      ],
    );
  }
}

class _DefaultOptionsForSingleChoice extends StatelessWidget {
  final String defaultOption;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const _DefaultOptionsForSingleChoice({
    required this.defaultOption,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownCustomizationButton<String>(
      value: defaultOption,
      withColor: true,
      items: options
          .map(
            (option) => DropdownCustomizationItem(
              value: option,
              onChange: onChanged,
              child: Text(
                option,
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _DefaultOptionsForMultipleChoice extends StatelessWidget {
  final List<String> defaultOptions;
  final List<String> options;
  final ValueChanged<List<String>?> onChanged;

  const _DefaultOptionsForMultipleChoice({
    required this.defaultOptions,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...defaultOptions.map(
          (option) => Option(
            option: option,
            onDelete: () {
              final newOptions =
                  defaultOptions.where((e) => e != option).toList()..sort();

              if (newOptions.isNotEmpty) {
                onChanged(newOptions);
              }
            },
          ),
        ),
        DropdownCustomizationButton<String?>(
          value: null,
          items: [
            DropdownCustomizationItem(
              value: null,
              child: Text(
                context.localization.clickToSelectTheOption,
                style: const TextStyle(
                  color: AppColors.textHintGrey,
                ),
              ),
            ),
            ...options.where((option) => !defaultOptions.contains(option)).map(
                  (option) => DropdownCustomizationItem(
                    value: option,
                    onChange: (selectedOption) {
                      final newOptions = List.of(defaultOptions)
                        ..add(selectedOption!)
                        ..sort();
                      onChanged(newOptions);
                    },
                    child: Text(
                      option,
                      style: context.theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
          ],
          withColor: true,
        ),
      ],
    );
  }
}
