import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/input_question_theme.dart';
import 'package:survey_core/src/presentation/di/injector.dart';
import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_subtitle.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

class InputQuestionPage extends StatefulWidget {
  final InputQuestionData data;
  final QuestionAnswer onSend;

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
  String _input = '';
  final _cubit = Injector().surveyCubit;

  bool get _canBeSkipped => widget.data.isSkip && _input.isEmpty;

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
    return BlocBuilder<SurveyCubit, SurveyState>(
      bloc: _cubit,
      builder: (context, state) {
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
                child: Form(
                  key: _textFieldKey,
                  child: TextFormField(
                    minLines: theme.minLines,
                    maxLines: theme.maxLines,
                    style: TextStyle(
                      color: theme.textColor,
                      fontSize: theme.textSize,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) => _canBeSkipped
                        ? null
                        : widget.data.validator.validate(
                            text,
                          ),
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
                  if ((_textFieldKey.currentState?.validate() ?? false) ||
                      widget.data.isSkip) {
                    _cubit.saveAnswer(widget.data);
                  }
                },
                isEnabled: _canBeSkipped ||
                    (_textFieldKey.currentState?.isValid ?? false),
              ),
            ],
          ),
        );
      },
    );
  }
}
