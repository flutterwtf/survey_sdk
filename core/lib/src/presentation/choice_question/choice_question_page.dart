import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/choice_question_theme.dart';
import 'package:survey_core/src/presentation/survey/controller/survey_controller.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ChoiceQuestionPage extends StatefulWidget {
  final ChoiceQuestionData data;
  final OnSendCallback onSend;

  const ChoiceQuestionPage({
    super.key,
    required this.data,
    required this.onSend,
  });

  @override
  State<ChoiceQuestionPage> createState() => _ChoiceQuestionPageState();
}

class _ChoiceQuestionPageState extends State<ChoiceQuestionPage>
    with SingleTickerProviderStateMixin {
  late final SurveyController _controller;
  bool _canBeSend = false;
  List<String> _selectedItems = List.empty();

  ChoiceQuestionTheme get _theme => widget.data.theme ?? const ChoiceQuestionTheme.common();

  @override
  void initState() {
    super.initState();
  }


  @override
  void didChangeDependencies() {
    _controller = SurveyControllerInherited.of(context).surveyController;
    super.didChangeDependencies();
  }

  void _onInputChanged(List<String>? selectedItems) {
    _selectedItems = selectedItems ?? List.empty();

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
                  )
                : _QuestionRadioButtons(
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
            onPressed: () {
              _controller.onNext(widget.data.type, _selectedItems);
              widget.onSend.call(_selectedItems);
            },
            isEnabled: widget.data.isSkip ? true : _canBeSend,
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
  });

  final List<String> options;
  final void Function(List<String>? selectedItems) onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: inactiveColor,
      ),
      child: FormBuilder(
        child: FormBuilderCheckboxGroup(
          orientation: OptionsOrientation.vertical,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          activeColor: activeColor,
          onChanged: onChanged,
          name: '',
          options: options
              .map(
                (option) => FormBuilderFieldOption(
                  value: option,
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: AppFonts.sizeM,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _QuestionRadioButtons extends StatelessWidget {
  const _QuestionRadioButtons({
    required this.options,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
  });

  final List<String> options;
  final void Function(String? selectedItem) onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: inactiveColor,
      ),
      child: FormBuilder(
        child: FormBuilderRadioGroup(
          orientation: OptionsOrientation.vertical,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          activeColor: activeColor,
          onChanged: onChanged,
          name: '',
          options: options
              .map(
                (option) => FormBuilderFieldOption(
                  value: option,
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: AppFonts.sizeM,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
