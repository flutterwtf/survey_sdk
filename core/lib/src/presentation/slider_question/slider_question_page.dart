import 'package:core/src/presentation/utils/app_fonts.dart';
import 'package:core/src/presentation/utils/constants.dart';
import 'package:core/src/presentation/widgets/question_bottom_button.dart';
import 'package:core/src/presentation/widgets/question_subtitle.dart';
import 'package:core/src/presentation/widgets/question_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SliderQuestionPage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double minValue;
  final double maxValue;
  final VoidCallback onSend;
  final bool isSkip;
  final Color activeColor;
  final Color inactiveColor;
  final double thickness;
  final Color thumbColor;
  final double thumbRadius;

  const SliderQuestionPage({
    super.key,
    required this.title,
    this.subtitle,
    required this.minValue,
    required this.maxValue,
    required this.onSend,
    this.isSkip = false,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.thickness = 8.0,
    this.thumbColor = Colors.black,
    this.thumbRadius = 8.0,
  });

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
            title: title,
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.margin2XL,
              ),
              child: QuestionSubtitle(
                content: subtitle!,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.marginM),
            child: _QuestionSlider(
              minValue: minValue,
              maxValue: maxValue,
              onChanged: (double? currentSliderValue) {},
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              thickness: thickness,
              thumbColor: thumbColor,
              thumbRadius: thumbRadius,
            ),
          ),
          const Spacer(),
          QuestionBottomButton(
            //TODO: move to localization?
            text: 'NEXT',
            onPressed: onSend,
            isEnabled: isSkip,
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
  final Color activeColor;
  final Color inactiveColor;
  final double thickness;
  final Color thumbColor;
  final double thumbRadius;

  const _QuestionSlider({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    required this.thickness,
    required this.thumbColor,
    required this.thumbRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        overlayShape: SliderComponentShape.noThumb,
        trackHeight: thickness,
        thumbColor: thumbColor,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: thumbRadius,
        ),
      ),
      child: Column(
        children: [
          FormBuilder(
            child: FormBuilderSlider(
              name: 'Slider',
              initialValue: minValue,
              min: minValue,
              max: maxValue,
              inactiveColor: inactiveColor,
              activeColor: activeColor,
              onChanged: onChanged,
              displayValues: DisplayValues.none,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
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
