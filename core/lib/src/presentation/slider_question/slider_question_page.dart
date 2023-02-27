import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_subtitle.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';

// TODO(dev): extend from one superclass maybe?
class SliderQuestionPage extends StatefulWidget {
  final SliderQuestionData data;
  final OnSendCallback onSend;

  const SliderQuestionPage({
    super.key,
    required this.data,
    required this.onSend,
  });

  @override
  State<SliderQuestionPage> createState() => _SliderQuestionPageState();
}

class _SliderQuestionPageState extends State<SliderQuestionPage> {
  late final SliderThemeData _theme;

  @override
  void didChangeDependencies() {
    if (widget.data.theme == null) {
      _theme = Theme.of(context).sliderTheme;
    } else {
      _theme = widget.data.theme!;
    }
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
            child: QuestionSubtitle(
              content: widget.data.subtitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.marginM),
            child: _QuestionSlider(
              minValue: widget.data.minValue,
              maxValue: widget.data.maxValue,
              initialValue: widget.data.initialValue,
              onChanged: (double? currentSliderValue) {},
              theme: _theme,
            ),
          ),
          const Spacer(),
          QuestionBottomButton(
            text: context.localization.next,
            // TODO(dev): replace '' with data
            onPressed: () => widget.onSend(''),
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
  final void Function(double? currentSliderValue) onChanged;
  final SliderThemeData theme;

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
      data: widget.theme,
      child: Column(
        children: [
          Slider(
            value: _value,
            onChanged: (newValue) => setState(() {
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
