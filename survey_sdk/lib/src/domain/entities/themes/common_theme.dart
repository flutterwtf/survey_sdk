import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';
import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/slider_question_data.dart';

// TODO(dev): docs.
class CommonTheme extends ThemeExtension<CommonTheme>
    with ApiObject, EquatableMixin {
  final SliderQuestionData slider;
  final IntroQuestionData intro;
  final InputQuestionData input;
  final ChoiceQuestionData choice;

  @override
  List<Object?> get props => [
        slider,
        intro,
        input,
        choice,
      ];

  CommonTheme({
    required this.choice,
    required this.slider,
    required this.intro,
    required this.input,
  });

  @override
  factory CommonTheme.fromJson(Map<String, dynamic> json) {
    return CommonTheme(
      slider: SliderQuestionData.fromJson(json['slider']),
      intro: IntroQuestionData.fromJson(json['intro']),
      input: InputQuestionData.fromJson(json['input']),
      choice: ChoiceQuestionData.fromJson(json['choice']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'slider': slider.toJson(),
        'intro': intro.toJson(),
        'input': input.toJson(),
        'choice': choice.toJson(),
      };

  @override
  CommonTheme copyWith({
    SliderQuestionData? slider,
    IntroQuestionData? intro,
    InputQuestionData? input,
    ChoiceQuestionData? choice,
  }) {
    return CommonTheme(
      slider: slider ?? this.slider,
      intro: intro ?? this.intro,
      input: input ?? this.input,
      choice: choice ?? this.choice,
    );
  }

  @override
  CommonTheme lerp(covariant CommonTheme? other, double t) {
    return CommonTheme(
      // TODO(dev): should we lerp it?
      slider: slider,
      intro: intro,
      input: input,
      choice: choice,
    );
  }
}
