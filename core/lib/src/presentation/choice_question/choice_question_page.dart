import 'package:core/src/presentation/utils/app_fonts.dart';
import 'package:core/src/presentation/utils/constants.dart';
import 'package:core/src/presentation/widgets/question_bottom_button.dart';
import 'package:core/src/presentation/widgets/question_content.dart';
import 'package:core/src/presentation/widgets/question_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ChoiceQuestionPage extends StatefulWidget {
  final String title;
  final String? content;
  final List<String> options;
  final bool isMultipleChoice;
  final VoidCallback onSend;
  final bool canBeSkipped;
  final Color activeColor;
  final Color inactiveColor;

  const ChoiceQuestionPage({
    super.key,
    required this.title,
    this.content,
    required this.options,
    required this.isMultipleChoice,
    required this.onSend,
    this.canBeSkipped = false,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
  });

  @override
  State<ChoiceQuestionPage> createState() => _ChoiceQuestionPageState();
}

class _ChoiceQuestionPageState extends State<ChoiceQuestionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _submitButtonAnimation;
  bool _canBeSend = false;
  List<String> _selectedItems = List.empty();

  @override
  void initState() {
    super.initState();
    _submitButtonAnimation = AnimationController(
      //TODO: move to const maybe?
      duration: const Duration(milliseconds: 200),
      //TODO: recheck lower opacity bound
      lowerBound: 0.8,
      vsync: this,
    );

    if (widget.canBeSkipped) {
      _submitButtonAnimation.value = 1;
    }
  }

  void _onInputChanged(List<String>? selectedItems) {
    _selectedItems = selectedItems ?? List.empty();

    if (!widget.canBeSkipped) {
      setState(() {
        _canBeSend = _selectedItems.isNotEmpty;
      });
      if (_canBeSend) {
        _submitButtonAnimation.forward();
      } else {
        _submitButtonAnimation.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
            title: widget.title,
          ),
          if (widget.content != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.marginXL,
              ),
              child: QuestionContent(
                content: widget.content!,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.margin2XL,
            ),
            child: widget.isMultipleChoice
                ? _QuestionCheckboxes(
                    options: widget.options,
                    onChanged: _onInputChanged,
                    activeColor: widget.activeColor,
                    inactiveColor: widget.inactiveColor,
                  )
                : _QuestionRadioButtons(
                    options: widget.options,
                    onChanged: (selectedItem) => _onInputChanged(
                      selectedItem == null ? null : [selectedItem],
                    ),
                    activeColor: widget.activeColor,
                    inactiveColor: widget.inactiveColor,
                  ),
          ),
          const Spacer(),
          AnimatedBuilder(
            animation: _submitButtonAnimation,
            builder: (_, __) => QuestionBottomButton(
              text: 'NEXT',
              onPressed: widget.onSend,
              isEnabled: widget.canBeSkipped ? true : _canBeSend,
              animatedColorOpacity: _submitButtonAnimation.value,
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
