import 'package:equatable/equatable.dart';
import 'package:survey_sdk/src/data/mappers/question_types/choice_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/input_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/intro_question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/slider_question_data_mapper.dart';
import 'package:survey_sdk/src/domain/entities/constants/question_types.dart';

/// Class that serves as a base for creating specific types of [QuestionData]
/// classes. [QuestionData] classes are used to represent data for various
/// types of questions and are used to display and set question data in the app
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

  final String primaryButtonText;

  final String secondaryButtonText;

  /// Question type
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

  /// Used to convert a Map from JSON to a [QuestionData] based on the
  /// question's type
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
