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
  /// This field contains the content for a page, including options.
  final ChoiceQuestionData data;

  // Contains the options indices that the user selected.
  final QuestionAnswer<List<String>>? answer;

  /// Callback that is called when [ChoiceQuestionData.isSkip] is true or at
  /// least one option has been selected.
  final OnSendCallback onSend;

  /// Optional callback that is called when the secondary button is tapped.
  final VoidCallback? onSecondaryButtonTap;

  const ChoiceQuestionPage({
    required this.data,
    required this.onSend,
    this.answer,
    this.onSecondaryButtonTap,
    super.key,
  });

  @override
  State<ChoiceQuestionPage> createState() => _ChoiceQuestionPageState();
}

class _ChoiceQuestionPageState extends State<ChoiceQuestionPage>
    with SingleTickerProviderStateMixin {
  /// Indicates whether the answer can be sent.
  bool _canBeSend = false;

  /// Stores the indices of the selected options.
  List<String> _answer = List.empty();

  /// Stores the last question data for correct work in admin.
  ChoiceQuestionData? _oldQuestionData;

  @override
  void initState() {
    super.initState();
    _initVariables();
  }

  void _initVariables() {
    _oldQuestionData = widget.data;
    final selectedOptions =
        widget.answer?.answer ?? widget.data.selectedByDefault;
    if (selectedOptions != null) {
      _answer = selectedOptions;
      _canBeSend = true;
    } else {
      _answer = List.empty();
      _canBeSend = widget.data.isSkip;
    }
  }

  void _onInputChanged(List<String>? selectedItems) {
    setState(() {
      _answer = selectedItems ?? List.empty();
    });

    if (!widget.data.isSkip) {
      final canBeSend = widget.data.ruleType.canBeSend(
            widget.data.ruleValue,
            _answer.length,
          ) &&
          _answer.isNotEmpty;
      setState(() => _canBeSend = canBeSend);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.data.theme ??
        Theme.of(context).extension<ChoiceQuestionTheme>()!;
    final options = widget.data.options;

    if (_oldQuestionData != widget.data) {
      _initVariables();
    }

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
                            selectedOptions: List.of(_answer),
                          )
                        : _QuestionRadioButtons(
                            selectedOption:
                                _answer.isEmpty ? null : _answer.first,
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
                                answer: QuestionAnswer<List<String>>(_answer),
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

  /// Available options for the radio buttons.
  final List<String> options;

  /// Indices of the selected options.
  final List<String> selectedOptions;

  /// Callback function called when the selection of checkboxes changes.
  final void Function(List<String>? selectedItems) onChanged;

  /// Color of the radio button when it is selected.
  final Color activeColor;

  /// Color of the radio button when it is not selected.
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                option,
                style: context.theme.textTheme.bodyMedium,
              ),
              value: selectedOptions.contains(option),
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
                  final options = shouldAdd
                      ? List.of(selectedOptions)
                      : selectedOptions.where((e) => e != option).toList();

                  if (shouldAdd) {
                    options.add(option);
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

  /// Available options for the radio buttons.
  final List<String> options;

  /// Index of the selected option.
  final String? selectedOption;

  /// Callback function called when the selection of radio buttons changes.
  final ValueChanged<String?> onChanged;

  /// Color of the radio button when it is selected.
  final Color activeColor;

  /// Color of the radio button when it is not selected.
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
                contentPadding: EdgeInsets.zero,
                groupValue: selectedOption,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  option,
                  style: context.theme.textTheme.bodyMedium,
                ),
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
