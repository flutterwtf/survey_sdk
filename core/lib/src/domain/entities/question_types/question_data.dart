import 'package:equatable/equatable.dart';
import 'package:survey_sdk/src/data/mappers/question_types/choice_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/input_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/intro_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/slider_question_data_mapper.dart';
import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';

/// The base class for creating specific types of question data classes.
///
/// The [QuestionData] is an abstract class that serves as the foundation
/// for creating various types of question data classes. It provides common
/// properties and methods that are shared among different question types.
abstract class QuestionData<T> extends Equatable {
  /// Index number of the question
  final int index;

  /// Text that appears at the top of a question page and serves as the main
  /// heading for the question
  final String title;

  /// Text that appears below the question title and provides additional
  /// context or information about the question
  final String subtitle;

  /// Optional text that appears below the question title
  final String? content;

  /// Indicates whether the user is allowed to skip the question without
  /// providing an answer
  final bool isSkip;

  /// The text for the primary button associated with the question.
  final String primaryButtonText;

  /// The text for the secondary button associated with the question.
  final String secondaryButtonText;

  /// The type of the question.
  ///
  /// Subclasses must provide an implementation for this property.
  String get type;

  const QuestionData({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.isSkip,
    required this.secondaryButtonText,
    required this.primaryButtonText,
    this.content,
  });

  QuestionData copyWith({
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    String? secondaryButtonText,
    String? primaryButtonText,
  });

  /// Converts a JSON map to a [QuestionData] instance based on the question's
  /// type.
  ///
  /// This method is used to deserialize a JSON map and create a specific
  /// subclass of [QuestionData] based on the "type" field in the JSON map.
  ///
  /// If the "type" field does not match any predefined question types, an
  /// [UnimplementedError] is thrown.
  static QuestionData fromType(Map<String, dynamic> json) {
    switch (json['type']) {
      case QuestionTypes.slider:
        return SliderQuestionDataMapper().fromJson(json);
      case QuestionTypes.intro:
        return IntroQuestionDataMapper().fromJson(json);
      case QuestionTypes.input:
        return InputQuestionDataMapper().fromJson(json);
      case QuestionTypes.choice:
        return ChoiceQuestionDataMapper().fromJson(json);
      default:
        throw UnimplementedError();
    }
  }
}
