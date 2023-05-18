import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/data/mappers/question_types/choice_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/input_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/intro_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/slider_question_data_mapper.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';
import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/slider_question_data.dart';

/// A theme class that extends the [ThemeExtension] and includes common
/// properties for various question types. It represents the visual styling and
/// configuration for displaying questions in a consistent manner.
class CommonTheme extends ThemeExtension<CommonTheme>
    with ApiObject, EquatableMixin {
  /// The theme configuration for slider questions.
  final SliderQuestionData slider;

  /// The theme configuration for intro questions.
  final IntroQuestionData intro;

  /// The theme configuration for input questions.
  final InputQuestionData input;

  /// The theme configuration for choice questions.
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
      slider: SliderQuestionDataMapper().fromJson(json['slider']),
      intro: IntroQuestionDataMapper().fromJson(json['intro']),
      input: InputQuestionDataMapper().fromJson(json['input']),
      choice: ChoiceQuestionDataMapper().fromJson(json['choice']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'slider': SliderQuestionDataMapper().toJson(slider),
        'intro': IntroQuestionDataMapper().toJson(intro),
        'input': InputQuestionDataMapper().toJson(input),
        'choice': ChoiceQuestionDataMapper().toJson(choice),
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

  /// Linearly interpolates between two instances of [CommonTheme].
  ///
  /// The [lerp] method calculates the intermediate state between two instances
  /// of [CommonTheme] based on a given interpolation factor [t].
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
