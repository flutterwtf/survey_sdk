import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/choice_question_theme.dart';
import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

class ChoiceQuestionPage extends StatefulWidget {
  final ChoiceQuestionData data;
  final OnSendCallback onSend;

  const ChoiceQuestionPage({
    required this.data,
    required this.onSend,
    super.key,
  });

  @override
  State<ChoiceQuestionPage> createState() => _ChoiceQuestionPageState();
}

class _ChoiceQuestionPageState extends State<ChoiceQuestionPage>
    with SingleTickerProviderStateMixin {
  bool _canBeSend = false;
  List<String> _selectedItems = List.empty();

  ChoiceQuestionTheme get _theme =>
      widget.data.theme ?? const ChoiceQuestionTheme.common();

  @override
  void initState() {
    super.initState();
  }

  void _onInputChanged(List<String>? selectedItems) {
    setState(() {
      _selectedItems = selectedItems ?? List.empty();
    });

    if (!widget.data.isSkip) {
      setState(() {
        _canBeSend = _selectedItems.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.data.content;
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.margin2XL,
        right: AppDimensions.margin2XL,
        top: AppDimensions.margin3XL,
        bottom: AppDimensions.marginXL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionTitle(
            title: widget.data.title,
          ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.marginXL,
              ),
              child: QuestionContent(
                content: content,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.margin2XL,
            ),
            child: widget.data.isMultipleChoice
                ? _QuestionCheckboxes(
                    options: widget.data.options,
                    onChanged: _onInputChanged,
                    activeColor: _theme.activeColor,
                    inactiveColor: _theme.inactiveColor,
                    selectedOptions: _selectedItems,
                  )
                : _QuestionRadioButtons(
                    selectedOption:
                        _selectedItems.isEmpty ? null : _selectedItems.first,
                    options: widget.data.options,
                    onChanged: (selectedItem) => _onInputChanged(
                      selectedItem == null ? null : [selectedItem],
                    ),
                    activeColor: _theme.activeColor,
                    inactiveColor: _theme.inactiveColor,
                  ),
          ),
          const Spacer(),
          QuestionBottomButton(
            text: context.localization.next,
            onPressed: () => widget.onSend.call(_selectedItems),
            isEnabled: widget.data.isSkip || _canBeSend,
          ),
        ],
      ),
    );
  }
}

class _QuestionCheckboxes extends StatelessWidget {
  const _QuestionCheckboxes({
    required this.options,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    required this.selectedOptions,
  });

  final List<String> options;
  final List<String> selectedOptions;
  final void Function(List<String>? selectedItems) onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(option),
              value: selectedOptions.contains(option),
              activeColor: Colors.transparent,
              checkColor: AppColors.black,
              side: MaterialStateBorderSide.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return BorderSide(color: activeColor);
                } else {
                  return BorderSide(color: inactiveColor);
                }
              }),
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onChanged: (shouldAdd) {
                if (shouldAdd != null) {
                  var options = selectedOptions;
                  if (shouldAdd) {
                    options = [...selectedOptions, option];
                  } else {
                    options.remove(option);
                  }
                  onChanged(options);
                }
              },
            ),
          )
          .toList(),
    );
  }
}

class _QuestionRadioButtons extends StatelessWidget {
  const _QuestionRadioButtons({
    required this.options,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    this.selectedOption,
  });

  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: inactiveColor,
      ),
      child: Column(
        children: options
            .map(
              (option) => RadioListTile<String?>(
                groupValue: selectedOption,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(option),
                value: option,
                activeColor: activeColor,
                onChanged: onChanged,
              ),
            )
            .toList(),
      ),
    );
  }
}
