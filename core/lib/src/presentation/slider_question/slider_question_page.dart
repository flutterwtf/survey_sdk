import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/slider_question_theme.dart';
import 'package:survey_core/src/presentation/localization/app_localizations_ext.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_content.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

class SliderQuestionPage extends StatefulWidget {
  final SliderQuestionData data;
  final OnSendCallback onSend;

  const SliderQuestionPage({
    required this.data,
    required this.onSend,
    super.key,
  });

  @override
  State<SliderQuestionPage> createState() => _SliderQuestionPageState();
}

class _SliderQuestionPageState extends State<SliderQuestionPage> {
  late final SliderQuestionTheme _theme;
  late double _answer;

  @override
  void initState() {
    super.initState();
    _answer = widget.data.initialValue.toDouble();
  }

  @override
  void didChangeDependencies() {
    final theme = Theme.of(context).extension<SliderQuestionTheme>() ??
        const SliderQuestionTheme.common();
    _theme = widget.data.theme ?? theme;
    super.didChangeDependencies();
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
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.marginM),
            child: _QuestionSlider(
              minValue: widget.data.minValue,
              maxValue: widget.data.maxValue,
              initialValue: widget.data.initialValue,
              onChanged: (value) => setState(() => _answer = value),
              theme: _theme,
            ),
          ),
          const Spacer(),
          QuestionBottomButton(
            text: context.localization.next,
            onPressed: () {
              widget.onSend.call(
                index: widget.data.index,
                answer: QuestionAnswer<double>(_answer),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _QuestionSlider extends StatefulWidget {
  final num minValue;
  final num maxValue;
  final num initialValue;
  final ValueChanged<double> onChanged;
  final SliderQuestionTheme theme;

  const _QuestionSlider({
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.theme,
    required this.initialValue,
  });

  @override
  State<_QuestionSlider> createState() => _QuestionSliderState();
}

class _QuestionSliderState extends State<_QuestionSlider> {
  late double _value;
  late final bool _onlyInt;

  @override
  void initState() {
    _value = widget.initialValue.toDouble();
    _onlyInt = widget.initialValue.ceilToDouble() ==
        widget.initialValue.floorToDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.theme.textTheme.bodyMedium?.copyWith(
      fontFamily: AppFonts.inter,
    );
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
            value: _value,
            onChanged: (newValue) =>
                setState(() {
                  _value = _onlyInt ? newValue.roundToDouble() : newValue;
                  widget.onChanged(newValue);
                }),
            min: widget.minValue.toDouble(),
            max: widget.maxValue.toDouble(),
          ),
          const SizedBox(height: AppDimensions.margin2XS),
          Row(
            children: [
              Text(
                widget.minValue.toString(),
                style: textStyle,
              ),
              const Spacer(),
              Text(
                widget.maxValue.toString(),
                style: textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
