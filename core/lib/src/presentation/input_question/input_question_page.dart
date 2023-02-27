import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/presentation/survey/controller/survey_controller.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_subtitle.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';
import 'package:flutter/material.dart';

class InputQuestionPage extends StatefulWidget {
  final InputQuestionData data;
  final OnSendCallback onSend;

  const InputQuestionPage({
    super.key,
    required this.data,
    required this.onSend,
  });

  @override
  State<InputQuestionPage> createState() => _InputQuestionPageState();
}

class _InputQuestionPageState extends State<InputQuestionPage> {
  late final SurveyController _controller;
  final _formKey = GlobalKey<FormFieldState>();
  String _input = '';

  @override
  void didChangeDependencies() {
    _controller = SurveyControllerInherited.of(context).surveyController;
    super.didChangeDependencies();
  }

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
            //TODO: add validator?
            child: FormField(
              key: _formKey,
              child: TextFormField(
                minLines: theme.minLines,
                maxLines: theme.maxLines,
                style: TextStyle(
                  color: theme.textColor,
                  fontSize: theme.textSize,
                ),
                validator: widget.data.validator.validate,
                onChanged: (input) => setState(() => _input = input),
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
              ),
            ),
          ),
          const Spacer(),
          QuestionBottomButton(
            text: context.localization.next,
            onPressed: () {
              if (_formKey.currentState?.isValid ?? false) {
                _controller.onNext(widget.data.type, _input);
                widget.onSend(_input);
              }
            },
            isEnabled: widget.data.isSkip,
          ),
        ],
      ),
    );
  }
}
