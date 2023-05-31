import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_sdk/src/domain/entities/themes/slider_question_theme.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';
import 'package:survey_sdk/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_sdk/src/presentation/widgets/question_content.dart';
import 'package:survey_sdk/src/presentation/widgets/question_title.dart';

/// The question page with a question, question description, button to submit
/// the answer and slider to select a value from a range.
class SliderQuestionPage extends StatefulWidget {
  /// Contains the content for a page as minimum and maximum values of the
  /// slider, the initial value of the slider, and other properties.
  final SliderQuestionData data;

  /// Contains the number that the user selected.
  final QuestionAnswer<int>? answer;

  /// Callback that is called after pressing bottom button.
  final OnSendCallback onSend;

  /// Optional callback that is called when the secondary button is tapped.
  final VoidCallback? onSecondaryButtonTap;

  const SliderQuestionPage({
    required this.data,
    required this.onSend,
    this.answer,
    this.onSecondaryButtonTap,
    super.key,
  });

  @override
  State<SliderQuestionPage> createState() => _SliderQuestionPageState();
}

class _SliderQuestionPageState extends State<SliderQuestionPage> {
  late int _answer;

  @override
  void initState() {
    super.initState();
    _answer = widget.answer?.answer ?? widget.data.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.data.theme ??
        Theme.of(context).extension<SliderQuestionTheme>()!;
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
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.marginM),
                    child: _QuestionSlider(
                      minValue: widget.data.minValue,
                      maxValue: widget.data.maxValue,
                      initialValue: _answer,
                      onChanged: (value) => setState(() => _answer = value),
                      theme: theme,
                      divisions: widget.data.divisions,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (widget.data.isSkip)
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: QuestionBottomButton(
                              text: widget.data.secondaryButtonText,
                              radius: theme.secondaryButtonRadius,
                              color: theme.secondaryButtonFill,
                              textColor: theme.secondaryButtonTextColor,
                              textSize: theme.secondaryButtonTextSize,
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
                              answer: QuestionAnswer<int>(_answer),
                            );
                          },
                          radius: theme.primaryButtonRadius,
                          color: theme.primaryButtonFill,
                          textColor: theme.primaryButtonTextColor,
                          textSize: theme.primaryButtonTextSize,
                        ),
                      ),
                    ],
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

class _QuestionSlider extends StatefulWidget {
  /// Minimum value of the slider.
  final int minValue;

  /// Maximum value of the slider.
  final int maxValue;

  /// Initial value of the slider.
  final int initialValue;

  /// Number of divisions for the slider.
  final int divisions;

  /// The callback function called when the value changes.
  final ValueChanged<int> onChanged;

  /// The theme configuration for the slider question.
  final SliderQuestionTheme theme;

  const _QuestionSlider({
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.divisions,
    required this.theme,
    required this.initialValue,
  });

  @override
  State<_QuestionSlider> createState() => _QuestionSliderState();
}

class _QuestionSliderState extends State<_QuestionSlider> {
  /// The current value of the slider.
  late int _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.theme.textTheme.bodyMedium?.copyWith(
      fontFamily: AppFonts.inter,
    );
    _value = _value >= widget.minValue && _value <= widget.maxValue
        ? _value
        : widget.initialValue;
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: widget.theme.activeColor,
        inactiveTrackColor: widget.theme.inactiveColor,
        thumbColor: widget.theme.thumbColor,
        trackHeight: widget.theme.thickness,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: widget.theme.thumbRadius,
        ),
      ),
      child: Column(
        children: [
          Slider(
            divisions: widget.divisions,
            value: _value.toDouble(),
            onChanged: (newValue) => setState(() {
              _value = newValue.toInt();
              widget.onChanged(_value);
            }),
            min: widget.minValue.toDouble(),
            max: widget.maxValue.toDouble(),
          ),
          const SizedBox(height: AppDimensions.margin2XS),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: AppDimensions.sizeM),
                child: Text(
                  widget.minValue.toString(),
                  style: textStyle,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: AppDimensions.sizeM),
                child: Text(
                  widget.maxValue.toString(),
                  style: textStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
