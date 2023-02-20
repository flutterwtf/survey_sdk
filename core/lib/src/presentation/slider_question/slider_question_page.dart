import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_subtitle.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';
import 'package:flutter/material.dart';

//TODO: extend from one superclass maybe?
class SliderQuestionPage extends StatefulWidget {
  final SliderQuestionData data;
  final OnSendCallback onSend;
  final bool onlyIntegerN;

  const SliderQuestionPage({
    super.key,
    required this.data,
    required this.onSend,
    this.onlyIntegerN = false,
  });

  @override
  State<SliderQuestionPage> createState() => _SliderQuestionPageState();
}

class _SliderQuestionPageState extends State<SliderQuestionPage> {
  late final SliderThemeData _theme;

  @override
  void initState() {
    if (widget.data.theme == null) {
      _theme = Theme.of(context).sliderTheme;
    } else {
      _theme = widget.data.theme!;
    }
    super.initState();
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
            child: QuestionSubtitle(
              content: widget.data.subtitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.marginM),
            child: _QuestionSlider(
              minValue: widget.data.minValue,
              maxValue: widget.data.maxValue,
              onChanged: (double? currentSliderValue) {},
              theme: _theme,
              onlyIntegerN: widget.onlyIntegerN,
            ),
          ),
          const Spacer(),
          QuestionBottomButton(
            //TODO: move to localization?
            text: 'NEXT',
            //TODO: replace '' with data
            onPressed: () => widget.onSend(''),
          ),
        ],
      ),
    );
  }
}

class _QuestionSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final bool onlyIntegerN;
  final void Function(double? currentSliderValue) onChanged;
  final SliderThemeData theme;

  const _QuestionSlider({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.theme,
    required this.onlyIntegerN,
  }) : super(key: key);

  @override
  State<_QuestionSlider> createState() => _QuestionSliderState();
}

class _QuestionSliderState extends State<_QuestionSlider> {
  late double value;
  @override
  void initState() {
    // TODO: implement initState
    value = widget.minValue + (widget.maxValue - widget.minValue) / 2;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: widget.theme,
      child: Column(
        children: [
          Slider(
            value: widget.onlyIntegerN ? value.roundToDouble() : value,
            onChanged: (newValue) => setState(() {
              value = widget.onlyIntegerN ? newValue.roundToDouble() : newValue;
              widget.onChanged(newValue);
            }),
            min: widget.minValue,
            max: widget.maxValue,
          ),
          const SizedBox(height: AppDimensions.margin2XS),
          Row(
            children: [
              Text(
                widget.minValue.toString(),
                style: const TextStyle(fontSize: AppFonts.sizeM),
              ),
              const Spacer(),
              Text(
                widget.maxValue.toString(),
                style: const TextStyle(fontSize: AppFonts.sizeM),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
