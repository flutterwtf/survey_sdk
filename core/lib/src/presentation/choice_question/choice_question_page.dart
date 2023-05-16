import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/choice_question_theme.dart';
import 'package:survey_sdk/src/presentation/utils/rule_type_extension.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';
import 'package:survey_sdk/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_sdk/src/presentation/widgets/question_content.dart';
import 'package:survey_sdk/src/presentation/widgets/question_title.dart';

/// The page with options to choose from,
/// along with a question, question description, and a button.
///
/// The appearance of the page varies based on the value of
/// [ChoiceQuestionData.isMultipleChoice] - if it is true, checkboxes will be
/// displayed to allow selecting multiple options. If
/// [ChoiceQuestionData.isMultipleChoice] is false, radio buttons will be
/// displayed to allow selecting a single option.
class ChoiceQuestionPage extends StatefulWidget {
  /// This field contains the content for a page, including options
  final ChoiceQuestionData data;

  /// Callback that is called when [ChoiceQuestionData.isSkip] is true or at
  /// least one option has been selected
  final OnSendCallback onSend;

  final VoidCallback? onSecondaryButtonTap;

  const ChoiceQuestionPage({
    required this.data,
    required this.onSend,
    this.onSecondaryButtonTap,
    super.key,
  });

  @override
  State<ChoiceQuestionPage> createState() => _ChoiceQuestionPageState();
}

class _ChoiceQuestionPageState extends State<ChoiceQuestionPage>
    with SingleTickerProviderStateMixin {
  bool _canBeSend = false;
  List<int> _selectedItems = List.empty();

  @override
  void initState() {
    final selectedOptions = widget.data.selectedOptions;
    super.initState();
    if (selectedOptions != null) {
      _selectedItems = selectedOptions;
      _canBeSend = true;
    }
  }

  void _onInputChanged(List<int>? selectedItems) {
    setState(() {
      _selectedItems = selectedItems ?? List.empty();
    });

    if (!widget.data.isSkip) {
      final canBeSend = widget.data.ruleType.canBeSend(
            widget.data.ruleValue,
            _selectedItems.length,
          ) &&
          _selectedItems.isNotEmpty;
      setState(() => _canBeSend = canBeSend);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.data.theme ??
        Theme.of(context).extension<ChoiceQuestionTheme>()!;
    final options = widget.data.options;
    return Scaffold(
      backgroundColor: theme.fill,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppDimensions.margin2XL,
                right: AppDimensions.margin2XL,
                top: AppDimensions.margin3XL,
                bottom: AppDimensions.marginXL,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.data.title.isNotEmpty)
                    QuestionTitle(
                      title: widget.data.title,
                      textColor: theme.titleColor,
                      textSize: theme.titleSize,
                    ),
                  if (widget.data.subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimensions.marginS,
                      ),
                      // TODO(dev): We passed a subtitle to widget for content?
                      child: QuestionContent(
                        content: widget.data.subtitle,
                        textColor: theme.subtitleColor,
                        textSize: theme.subtitleSize,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimensions.marginM,
                    ),
                    child: widget.data.isMultipleChoice
                        ? _QuestionCheckboxes(
                            options: options,
                            onChanged: _onInputChanged,
                            activeColor: theme.activeColor,
                            inactiveColor: theme.inactiveColor,
                            selectedOptions: List.of(_selectedItems),
                          )
                        : _QuestionRadioButtons(
                            selectedOption: _selectedItems.isEmpty
                                ? null
                                : _selectedItems.first,
                            options: options,
                            onChanged: (selectedItem) => _onInputChanged(
                              selectedItem == null ? null : [selectedItem],
                            ),
                            activeColor: theme.activeColor,
                            inactiveColor: theme.inactiveColor,
                          ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.marginS),
                    child: Row(
                      children: [
                        if (widget.data.isSkip)
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: QuestionBottomButton(
                                text: widget.data.secondaryButtonText,
                                color: theme.secondaryButtonFill,
                                textColor: theme.secondaryButtonTextColor,
                                textSize: theme.secondaryButtonTextSize,
                                radius: theme.secondaryButtonRadius,
                                onPressed: widget.onSecondaryButtonTap,
                              ),
                            ),
                          ),
                        Flexible(
                          child: QuestionBottomButton(
                            text: widget.data.primaryButtonText,
                            onPressed: () {
                              widget.onSend.call(
                                index: widget.data.index,
                                answer: QuestionAnswer<List<int>>(
                                  _selectedItems,
                                ),
                              );
                            },
                            isEnabled: widget.data.isSkip || _canBeSend,
                            color: theme.primaryButtonFill,
                            textColor: theme.primaryButtonTextColor,
                            textSize: theme.primaryButtonTextSize,
                            radius: theme.primaryButtonRadius,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
  final List<int> selectedOptions;
  final void Function(List<int>? selectedItems) onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < options.length; i++)
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              options[i],
              style: context.theme.textTheme.bodyMedium,
            ),
            value: selectedOptions.contains(i),
            activeColor: Colors.transparent,
            checkColor: AppColors.black,
            side: MaterialStateBorderSide.resolveWith((states) {
              return states.contains(MaterialState.selected)
                  ? BorderSide(color: activeColor)
                  : BorderSide(color: inactiveColor);
            }),
            checkboxShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            onChanged: (shouldAdd) {
              if (shouldAdd != null) {
                final options = selectedOptions;
                if (shouldAdd) {
                  options.add(i);
                } else {
                  options.remove(i);
                }
                onChanged(options);
              }
            },
          ),
      ],
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
  final int? selectedOption;
  final ValueChanged<int?> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: inactiveColor,
      ),
      child: Column(
        children: [
          for (int i = 0; i < options.length; i++)
            RadioListTile<int?>(
              contentPadding: EdgeInsets.zero,
              groupValue: selectedOption,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                options[i],
                style: context.theme.textTheme.bodyMedium,
              ),
              value: i,
              activeColor: activeColor,
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }
}
