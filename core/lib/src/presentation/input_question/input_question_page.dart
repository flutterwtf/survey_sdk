import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_subtitle.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

//TODO: create child<T> widget for date,password,text,number etc
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
  final format = DateFormat('dd.MM.yyyy');

  bool get _canBeSkipped => widget.data.isSkip && _dateTime.toString().isEmpty;
  // bool get _canBeSkipped => widget.data.isSkip && _input.isEmpty;

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
            child: QuestionSubtitle(
              content: widget.data.subtitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.marginM),
            child: DateTimeField(
              key: _textFieldKey,
              style: TextStyle(
                color: theme.textColor,
                fontSize: theme.textSize,
              ),
              decoration: InputDecoration(
                fillColor: theme.backgroundColor,
                hintText: widget.data.hintText ?? '',
                hintStyle: TextStyle(
                  color: theme.hintColor,
                  fontSize: theme.hintSize,
                ),
                enabledBorder: border,
                focusedBorder: border,
                border: border,
              ),
              format: format,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (dateTime) => _canBeSkipped
                  ? null
                  : widget.data.validator.validate(dateTime.toString()),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _dateTime = value;
                  });
                }
              },
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1000),
                  initialDate: _dateTime,
                  lastDate: DateTime(9000),
                );
                if (date != null) {
                  return date;
                }
                return currentValue;
              },
            ),
            //     Form(
            //   key: _textFieldKey,
            //   child: TextFormField(
            //     minLines: theme.minLines,
            //     maxLines: theme.maxLines,
            //     style: TextStyle(
            //       color: theme.textColor,
            //       fontSize: theme.textSize,
            //     ),
            //     autovalidateMode: AutovalidateMode.onUserInteraction,
            //     validator: (text) =>
            //         _canBeSkipped ? null : widget.data.validator.validate(text),
            //     onChanged: (input) => setState(() => _input = input),
            //     decoration: InputDecoration(
            //       fillColor: theme.backgroundColor,
            //       hintText: widget.data.hintText ?? '',
            //       hintStyle: TextStyle(
            //         color: theme.hintColor,
            //         fontSize: theme.hintSize,
            //       ),
            //       enabledBorder: border,
            //       focusedBorder: border,
            //       border: border,
            //     ),
            //   ),
            // ),
          ),
          const Spacer(),
          QuestionBottomButton(
            text: context.localization.next,
            onPressed: () {
              if ((_textFieldKey.currentState?.validate() ?? false) ||
                  widget.data.isSkip) {
                widget.onSend(key: widget.data.type, data: _dateTime);
                // widget.onSend(key: widget.data.type, data: _input);
              }
            },
            isEnabled:
                _canBeSkipped || (_textFieldKey.currentState?.isValid ?? false),
          ),
        ],
      ),
    );
  }
}
