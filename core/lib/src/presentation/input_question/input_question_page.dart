import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';
import 'package:survey_sdk/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_sdk/src/presentation/widgets/question_content.dart';
import 'package:survey_sdk/src/presentation/widgets/question_title.dart';

const _radius = AppDimensions.circularRadiusXS;

/// The question page with an input field for the
/// user to enter a response. It includes a question, question description,
/// button to submit the response, and an input widget to enter the response.
///
/// The [InputQuestionData.validator.type] determines the type of input field
/// displayed on the page. If [InputType.number], a [TextFormField] that only
/// allows numbers is displayed. If [InputType.date], a [DateTimeField] is
/// displayed to select a date.
// TODO(dev): create child<T> widget for date,password,text,number etc.
class InputQuestionPage extends StatefulWidget {
  /// Contains the content for a page.
  final InputQuestionData data;

  // Contains string that the user enter.
  final QuestionAnswer? answer;

  /// Callback that is called after pressing bottom button if input data is
  /// valid or when the question can be skipped.
  final OnSendCallback onSend;

  /// Optional callback that is called when the secondary button is tapped.
  final VoidCallback? onSecondaryButtonTap;

  const InputQuestionPage({
    required this.data,
    required this.onSend,
    this.answer,
    this.onSecondaryButtonTap,
    super.key,
  });

  @override
  State<InputQuestionPage> createState() => _InputQuestionPageState();
}

class _InputQuestionPageState extends State<InputQuestionPage> {
  DateTime _dateTime = DateTime.now();
  String _input = '';

  //DateTime? _dateAnswer; 

  bool get _canBeSkippedDate =>
      widget.data.isSkip && _dateTime.toString().isEmpty;

  bool get _canBeSkippedNumber => widget.data.isSkip && _input.isEmpty;

  bool get isDateType => widget.data.validator.type == InputType.date;

  @override
  void initState() {
    super.initState();

    if (widget.answer is QuestionAnswer<String>) {
      _input = widget.answer!.answer;
    } else if (widget.answer is QuestionAnswer<DateTime>) {
      _dateTime = widget.answer!.answer;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        widget.data.theme ?? Theme.of(context).extension<InputQuestionTheme>()!;
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: theme.borderColor,
        width: theme.borderWidth,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          _radius,
        ),
      ),
    );
    final hintText = widget.data.hintText;
    final isValid = widget.data.validator.validate(
      isDateType ? _dateTime.toString() : _input,
    );
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
                      textSize: theme.titleSize,
                      textColor: theme.titleColor,
                    ),
                  if (widget.data.subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimensions.marginS,
                      ),
                      child: QuestionContent(
                        content: widget.data.subtitle,
                        textSize: theme.subtitleSize,
                        textColor: theme.subtitleColor,
                      ),
                    ),
                  // TODO(dev): maybe create generic widget for some inputs
                  //  (date,number,string and etc).
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppDimensions.marginM + theme.verticalPadding,
                      bottom: theme.verticalPadding,
                    ),
                    child: isDateType
                        ? _InputDate(
                            border: border,
                            dateTime: _dateTime,
                            hasInitialValue: widget.answer != null,
                            hintText: hintText ?? '',
                            onChanged: (value) {
                              if (value != null) {
                                setState(() => _dateTime = value);
                              }
                            },
                            // TODO(dev): pass args instead of theme.
                            theme: theme,
                            validator: (text) => _canBeSkippedNumber
                                ? null
                                : widget.data.validator
                                    .validate(_dateTime.toString()),
                          )
                        : _InputNumber(
                            border: border,
                            hintText: hintText ?? '',
                            onChanged: (input) =>
                                setState(() => _input = input),
                            theme: theme,
                            initialValue: _input,
                            validator: (text) => _canBeSkippedNumber
                                ? null
                                : widget.data.validator.validate(text),
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
                                textSize: theme.secondaryButtonTextSize,
                                textColor: theme.secondaryButtonTextColor,
                                radius: theme.secondaryButtonRadius,
                                onPressed: widget.onSecondaryButtonTap,
                              ),
                            ),
                          ),
                        Flexible(
                          child: QuestionBottomButton(
                            text: widget.data.primaryButtonText,
                            onPressed: () {
                              if ((isValid == null) || widget.data.isSkip) {
                                isDateType
                                    ? widget.onSend.call(
                                        index: widget.data.index,
                                        answer:
                                            QuestionAnswer<DateTime>(_dateTime),
                                      )
                                    : widget.onSend.call(
                                        index: widget.data.index,
                                        answer: QuestionAnswer<String>(_input),
                                      );
                              }
                            },
                            isEnabled: isDateType
                                ? _canBeSkippedDate || (isValid == null)
                                : _canBeSkippedNumber || (isValid == null),
                            color: theme.primaryButtonFill,
                            textSize: theme.primaryButtonTextSize,
                            textColor: theme.primaryButtonTextColor,
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

/// Widget that represents an input field for selecting a date.
class _InputDate extends StatelessWidget {
  /// The border for the input field.
  final OutlineInputBorder border;

  /// The selected date value.
  final DateTime dateTime;

  /// Whether this Input Data has initial date.
  final bool hasInitialValue;

  /// The hint text displayed in the input field.
  final String hintText;

  /// The callback function called when the selected date changes.
  final Function(DateTime?) onChanged;

  /// The theme configuration for the input question.
  final InputQuestionTheme theme;

  /// The validator function that validates the selected date.
  final String? Function(DateTime?) validator;

  const _InputDate({
    required this.border,
    required this.dateTime,
    required this.hasInitialValue,
    required this.hintText,
    required this.onChanged,
    required this.theme,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      style: TextStyle(
        color: theme.textColor,
        fontSize: theme.textSize,
      ),
      decoration: InputDecoration(
        fillColor: theme.inputFill,
        hintText: hintText,
        hintStyle: TextStyle(
          color: theme.hintColor,
          fontSize: theme.hintSize,
        ),
        enabledBorder: border,
        focusedBorder: border,
        border: border,
      ),
      format: DateFormat('dd.MM.yyyy'),
      initialValue: hasInitialValue ? dateTime : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onChanged: onChanged,
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
          context: context,
          firstDate: DateTime(1000),
          initialDate: dateTime,
          lastDate: DateTime(9000),
        );
        if (date != null) {
          return date;
        }
        return currentValue;
      },
    );
  }
}

/// Widget that represents an input field for entering a numeric value.
class _InputNumber extends StatefulWidget {
  /// The border for the input field.
  final OutlineInputBorder border;

  /// The hint text displayed in the input field.
  final String hintText;

  /// The callback function called when the input value changes.
  final Function(String)? onChanged;

  /// The theme configuration for the input question.
  final InputQuestionTheme theme;

  /// The validator function that validates the input value.
  final String? Function(String?) validator;

  final String? initialValue;

  const _InputNumber({
    required this.border,
    required this.hintText,
    required this.onChanged,
    required this.theme,
    required this.validator,
    required this.initialValue,
  });

  @override
  State<_InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<_InputNumber> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        color: widget.theme.inputFill,
      ),
      child: Form(
        child: TextFormField(
          controller: _controller,
          maxLines: widget.theme.lines,
          style: TextStyle(
            color: widget.theme.textColor,
            fontSize: widget.theme.textSize,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            fillColor: widget.theme.inputFill,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.theme.hintColor,
              fontSize: widget.theme.hintSize,
            ),
            enabledBorder: widget.border,
            focusedBorder: widget.border,
            border: widget.border,
          ),
        ),
      ),
    );
  }
}
