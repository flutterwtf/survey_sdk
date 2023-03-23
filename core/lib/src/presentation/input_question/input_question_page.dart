import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/presentation/localization/app_localizations_ext.dart';
import 'package:survey_core/src/presentation/utils/app_dimensions.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

// TODO(dev): create child<T> widget for date,password,text,number etc.
class InputQuestionPage extends StatefulWidget {
  final InputQuestionData data;
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
    final theme = widget.data.theme ?? const InputQuestionTheme.common();
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: theme.borderColor,
        width: theme.borderWidth,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppDimensions.circularRadiusXS,
        ),
      ),
    );
    final hintText = widget.data.hintText;
    final isValid = _textFieldKey.currentState?.isValid;
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
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.margin2XL,
            ),
            child: QuestionContent(
              content: widget.data.subtitle,
            ),
          ),
          // TODO(dev): maybe create generic widget for some inputs
          //  (date,number,string and etc).
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.marginM),
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
                    theme: theme,
                    validator: (text) => _canBeSkippedNumber
                        ? null
                        : widget.data.validator.validate(_dateTime.toString()),
                  )
                : _InputNumber(
                    border: border,
                    hintText: hintText ?? '',
                    onChanged: (input) => setState(() => _input = input),
                    theme: theme,
                    textFieldKey: _textFieldKey,
                    validator: (text) => _canBeSkippedNumber
                        ? null
                        : widget.data.validator.validate(text),
                  ),
          ),
          const Spacer(),
          QuestionBottomButton(
            text: context.localization.next,
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
        fillColor: theme.backgroundColor,
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
    return Form(
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
          fillColor: theme.backgroundColor,
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
    );
  }
}
