import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';
import 'package:survey_core/survey_core.dart';

abstract class QuestionDataTransformers {
  QuestionData question;
  final ValueChanged<QuestionData> onTransformed;

  QuestionDataTransformers({
    required this.question,
    required this.onTransformed,
  });

  void updateTitle(String title) {
    question = question.copyWith(title: title);
    onTransformed(question);
  }

  void updateSubtitle(String subtitle) {
    question = question.copyWith(subtitle: subtitle);
    onTransformed(question);
  }

  void updateIsSkip({required bool isSkip}) {
    question = question.copyWith(isSkip: isSkip);
    onTransformed(question);
  }

  void updateContent(String content) {
    question = question.copyWith(content: content);
    onTransformed(question);
  }
}

class IntroQuestionTransformers extends QuestionDataTransformers {
  IntroQuestionTransformers({
    required super.question,
    required super.onTransformed,
  });

  // Common
  void updateFillColor(Color color) => throw UnimplementedError();

  void updateButtonColor(Color color) => throw UnimplementedError();

  void updateTitleColor(Color color) => throw UnimplementedError();

  void updateTitleFontSize(int? size) => throw UnimplementedError();

  void updateSubtitleColor(Color color) => throw UnimplementedError();

  void updateSubtitleFontSize(int? size) => throw UnimplementedError();

  void updateButtonTextColor(Color color) => throw UnimplementedError();

  void updateButtonFontSize(int? size) => throw UnimplementedError();

  void updateButtonRadius(int? radius) => throw UnimplementedError();

  // Content
  void updatePrimaryButtonText(String text) {
    question = (question as IntroQuestionData).copyWith(mainButtonTitle: text);
    onTransformed(question);
  }

  void updateSecondaryButton(bool isShown, String text) =>
      throw UnimplementedError();
}

class ChoiceQuestionTransformers extends QuestionDataTransformers {
  ChoiceQuestionTransformers({
    required super.question,
    required super.onTransformed,
  });

  // Common
  void updateFillColor(Color color) => throw UnimplementedError();

  void updateTitleColor(Color color) => throw UnimplementedError();

  void updateTitleFontSize(int? size) => throw UnimplementedError();

  void updateSubtitleColor(Color color) => throw UnimplementedError();

  void updateSubtitleFontSize(int? size) => throw UnimplementedError();

  void updateButtonColor(Color color) => throw UnimplementedError();

  void updateButtonTextColor(Color color) => throw UnimplementedError();

  void updateButtonFontSize(int? size) => throw UnimplementedError();

  void updateButtonRadius(int? radius) => throw UnimplementedError();

  // Buttons
  void updateActiveColor(Color color) => throw UnimplementedError();

  void updateInactiveColor(Color color) => throw UnimplementedError();

  void updateOptions(List<String> options) {
    super.question = (super.question as ChoiceQuestionData).copyWith(
      options: options,
    );
    super.onTransformed(super.question);
  }
}

class InputQuestionTransformers extends QuestionDataTransformers {
  InputQuestionTransformers({
    required super.question,
    required super.onTransformed,
  });

  // Common
  void updateFillColor(Color color) => throw UnimplementedError();

  void updateTitleColor(Color color) => throw UnimplementedError();

  void updateTitleFontSize(int? size) => throw UnimplementedError();

  void updateSubtitleColor(Color color) => throw UnimplementedError();

  void updateSubtitleFontSize(int? size) => throw UnimplementedError();

  void updateButtonFirstColor(Color color) => throw UnimplementedError();

  void updateButtonSecondColor(Color color) => throw UnimplementedError();

  void updateButtonFontSize(int? size) => throw UnimplementedError();

  // Input
  void updateMultiline(bool isMultiline, int? lineAmount) =>
      throw UnimplementedError();

  void updateInputFillColor(Color color) => throw UnimplementedError();

  void updateBorderColor(Color color) => throw UnimplementedError();

  void updateBorderSize(int? size) => throw UnimplementedError();

  void updateBorderWidth(int? width) => throw UnimplementedError();

  void updateHorizontalPadding(double? size) => throw UnimplementedError();

  void updateVerticalPadding(double? size) => throw UnimplementedError();

  void updateHintColor(Color color) => throw UnimplementedError();

  void updateHintFontSize(int? size) => throw UnimplementedError();

  void updateTextColor(Color color) => throw UnimplementedError();

  void updateTextFontSize(int? size) => throw UnimplementedError();

  void updateInputType(InputType inputType) => throw UnimplementedError();

  void updateHintText(String text) {
    question = (question as InputQuestionData).copyWith(hintText: text);
    onTransformed(question);
  }

  void updateButtonText(String text) => throw UnimplementedError();
}

class SliderQuestionTransformers extends QuestionDataTransformers {
  SliderQuestionTransformers({
    required super.question,
    required super.onTransformed,
  });

  // Common
  void updateButtonDownColor(Color color) => throw UnimplementedError();

  void updateButtonUpColor(Color color) => throw UnimplementedError();

  void updateFillColor(Color color) => throw UnimplementedError();

  void updateSubtitleColor(Color color) => throw UnimplementedError();

  void updateTitleColor(Color color) => throw UnimplementedError();

  void updateTitleFontSize(int size) => throw UnimplementedError();

  void updateSubtitleFontSize(int size) => throw UnimplementedError();

  void updateButtonFontSize(int size) => throw UnimplementedError();

  void updateButtonRadius(int size) => throw UnimplementedError();

  // Customization
  void updateActiveColor(Color color) => throw UnimplementedError();

  void updateInactiveColor(Color color) => throw UnimplementedError();

  void updateThickness(int size) => throw UnimplementedError();

  void updateThumbSize(int size) => throw UnimplementedError();

  void updateThumbColor(Color color) => throw UnimplementedError();

  // Content
  void updateDivisions(int? divisions) => throw UnimplementedError();

  void updateMinMax(int? min, int? max) {
    // TODO(dev): not updates state
    question = (question as SliderQuestionData).copyWith(
      minValue: min ?? 0,
      maxValue: max ?? 10,
    );
    onTransformed(question);
  }
}
