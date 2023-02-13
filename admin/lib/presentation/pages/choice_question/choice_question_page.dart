import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:survey_sdk/presentation/widgets/question_bottom_button.dart';
import 'package:survey_sdk/presentation/widgets/question_content.dart';
import 'package:survey_sdk/presentation/widgets/question_title.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';

part 'question_checkboxes.dart';

part 'question_radio_buttons.dart';

class ChoiceQuestionPage extends StatefulWidget {
  const ChoiceQuestionPage({
    super.key,
    required this.title,
    this.content,
    required this.options,
    required this.isMultiplyChoice,
    required this.onSend,
    this.canBeSkipped = false,
    this.activeColor = AppColors.black,
    this.inactiveColor = Colors.grey,
  });

  final String title;
  final String? content;
  final List<String> options;
  final bool isMultiplyChoice;
  final VoidCallback onSend;
  final bool canBeSkipped;
  final Color activeColor;
  final Color inactiveColor;

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
      duration: const Duration(milliseconds: 200),
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
            child: widget.isMultiplyChoice
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
