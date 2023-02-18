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

class _QuestionSlider extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final void Function(double? currentSliderValue) onChanged;
  final SliderThemeData theme;

  const _QuestionSlider({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: theme,
      child: Column(
        children: [
          Slider(
            value: minValue + (maxValue - minValue) / 2,
            onChanged: onChanged,
            min: minValue,
            max: maxValue,
          ),
          const SizedBox(height: AppDimensions.margin2XS),
          Row(
            children: [
              Text(
                minValue.toString(),
                style: const TextStyle(fontSize: AppFonts.sizeM),
              ),
              const Spacer(),
              Text(
                maxValue.toString(),
                style: const TextStyle(fontSize: AppFonts.sizeM),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
