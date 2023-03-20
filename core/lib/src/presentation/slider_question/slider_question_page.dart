import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/domain/entities/themes/slider_question_theme.dart';
import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/utils/theme_extension.dart';
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
  late int _answer;

  @override
  void initState() {
    super.initState();
    _answer = widget.data.initialValue.toInt();
  }

  SliderQuestionTheme get _theme =>
      widget.data.theme ?? const SliderQuestionTheme.common();

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
                answer: QuestionAnswer<int>(_answer),
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
  final ValueChanged<int> onChanged;
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
            onChanged: (newValue) => setState(() {
              _value = _onlyInt ? newValue.roundToDouble() : newValue;
              widget.onChanged(newValue.toInt());
            }),
            min: widget.minValue.toDouble(),
            max: widget.maxValue.toDouble(),
          ),
          const SizedBox(height: AppDimensions.margin2XS),
          Row(
            children: [
              Text(
                widget.minValue.toString(),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: AppFonts.inter,
                ),
              ),
              const Spacer(),
              Text(
                widget.maxValue.toString(),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: AppFonts.inter,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
