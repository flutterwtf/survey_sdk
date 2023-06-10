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
  final QuestionAnswer<double>? answer;

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
  late double _answer;

  /// Stores the last question data for correct work in admin.
  SliderQuestionData? _oldQuestionData;

  @override
  void initState() {
    super.initState();
    _initVariables();
  }

  void _initVariables() {
    _oldQuestionData = widget.data;
    _answer = widget.answer?.answer ?? widget.data.initialValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    if (_oldQuestionData != widget.data) {
      _initVariables();
    }
  
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
                left: SurveyDimensions.margin2XL,
                right: SurveyDimensions.margin2XL,
                top: SurveyDimensions.margin3XL,
                bottom: SurveyDimensions.marginXL,
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
                        top: SurveyDimensions.marginS,
                      ),
                      child: QuestionContent(
                        content: widget.data.subtitle,
                        textSize: theme.subtitleSize,
                        textColor: theme.subtitleColor,
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: SurveyDimensions.marginM),
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
                              answer: QuestionAnswer<double>(_answer),
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
  final double initialValue;

  /// Number of divisions for the slider.
  final int divisions;

  /// The callback function called when the value changes.
  final ValueChanged<double> onChanged;

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
  late double _value;

  /// A flag indicating whether the slider only allows integer values.
  late final bool _onlyInt;

  @override
  void initState() {
    _value = widget.initialValue;
    _onlyInt = widget.initialValue.ceilToDouble() ==
        widget.initialValue.floorToDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.theme.textTheme.bodyMedium?.copyWith(
      fontFamily: SurveyFonts.inter,
    );
    _value = _value >= widget.minValue.toDouble() &&
            _value <= widget.maxValue.toDouble()
        ? _value
        : widget.initialValue;
    return Theme(
      data: ThemeData(useMaterial3: true),
      child: SliderTheme(
        data: SliderThemeData(
          activeTrackColor: widget.theme.activeColor,
          inactiveTrackColor: widget.theme.inactiveColor,
          thumbColor: widget.theme.thumbColor,
          trackHeight: widget.theme.thickness,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: widget.theme.thumbRadius,
          ),
          valueIndicatorColor: widget.theme.activeColor,
        ),
        child: Column(
          children: [
            Slider(
              divisions: widget.divisions,
              value: _value,
              onChanged: (newValue) => setState(() {
                _value = _onlyInt ? newValue.roundToDouble() : newValue;
                widget.onChanged(newValue);
              }),
              label: _value.round().toString(),
              min: widget.minValue.toDouble(),
              max: widget.maxValue.toDouble(),
            ),
            const SizedBox(height: SurveyDimensions.margin2XS),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: SurveyDimensions.sizeM),
                  child: Text(
                    widget.minValue.toString(),
                    style: textStyle,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: SurveyDimensions.sizeM),
                  child: Text(
                    widget.maxValue.toString(),
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
