import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

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
  /// Contains the content for a page
  final InputQuestionData data;

  /// Callback that is called after pressing bottom button if input data is
  /// valid or when the question can be skipped
  final OnSendCallback onSend;

  const InputQuestionPage({
    required this.data,
    required this.onSend,
    super.key,
  });

  @override
  State<InputQuestionPage> createState() => _InputQuestionPageState();
}

class _InputQuestionPageState extends State<InputQuestionPage> {
  final _textFieldKey = GlobalKey<FormFieldState>();
  DateTime _dateTime = DateTime.now();
  String _input = '';

  bool get _canBeSkippedDate =>
      widget.data.isSkip && _dateTime.toString().isEmpty;

  bool get _canBeSkippedNumber => widget.data.isSkip && _input.isEmpty;

  bool get isDateType => widget.data.validator.type == InputType.date;

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
    final isValid = _textFieldKey.currentState?.isValid;
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
                      left: theme.horizontalPadding,
                      right: theme.horizontalPadding,
                    ),
                    child: isDateType
                        ? _InputDate(
                            border: border,
                            dateTime: _dateTime,
                            hintText: hintText ?? '',
                            onChanged: (value) {
                              if (value != null) {
                                setState(() => _dateTime = value);
                              }
                            },
                            textFieldKey: _textFieldKey,
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
                            textFieldKey: _textFieldKey,
                            validator: (text) => _canBeSkippedNumber
                                ? null
                                : widget.data.validator.validate(text),
                          ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.marginS),
                    child: QuestionBottomButton(
                      text: widget.data.buttonText,
                      onPressed: () {
                        if ((_textFieldKey.currentState?.validate() ?? false) ||
                            widget.data.isSkip) {
                          isDateType
                              ? widget.onSend.call(
                                  index: widget.data.index,
                                  answer: QuestionAnswer<DateTime>(_dateTime),
                                )
                              : widget.onSend.call(
                                  index: widget.data.index,
                                  answer: QuestionAnswer<String>(_input),
                                );
                        }
                      },
                      isEnabled: isDateType
                          ? _canBeSkippedDate || (isValid ?? false)
                          : _canBeSkippedNumber || (isValid ?? false),
                      color: theme.buttonFill,
                      textSize: theme.buttonTextSize,
                      textColor: theme.buttonTextColor,
                      radius: theme.buttonRadius,
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

class _InputDate extends StatelessWidget {
  final OutlineInputBorder border;
  final DateTime dateTime;
  final String hintText;
  final Function(DateTime?) onChanged;
  final GlobalKey<FormFieldState> textFieldKey;
  final InputQuestionTheme theme;
  final String? Function(DateTime?) validator;

  const _InputDate({
    required this.border,
    required this.dateTime,
    required this.hintText,
    required this.onChanged,
    required this.textFieldKey,
    required this.theme,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      key: textFieldKey,
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

class _InputNumber extends StatelessWidget {
  final OutlineInputBorder border;
  final String hintText;
  final Function(String)? onChanged;
  final GlobalKey<FormFieldState> textFieldKey;
  final InputQuestionTheme theme;
  final String? Function(String?) validator;

  const _InputNumber({
    required this.border,
    required this.hintText,
    required this.onChanged,
    required this.textFieldKey,
    required this.theme,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
        color: theme.inputFill,
      ),
      child: Form(
        key: textFieldKey,
        child: TextFormField(
          maxLines: theme.lines,
          style: TextStyle(
            color: theme.textColor,
            fontSize: theme.textSize,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onChanged: onChanged,
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
        ),
      ),
    );
  }
}
