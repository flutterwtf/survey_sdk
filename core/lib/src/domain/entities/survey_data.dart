import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/common_theme.dart';

/// Holds the core survey data used in the whole app, including the list of
/// questions and the common theme
class SurveyData extends ApiObject {
  /// List of questions used to build question pages of different types
  /// of questions
  final List<QuestionData> questions;

  /// Defines the visual properties used throughout the app
  final CommonTheme commonTheme;

  List<Object?> get props => [
        ...questions,
        commonTheme,
      ];

  SurveyData({
    required this.questions,
    required this.commonTheme,
  });

  factory SurveyData.fromJson(Map<String, dynamic> json) {
    final questions = <QuestionData>[];
    for (final questionJson in json['questions']) {
      questions.add(QuestionData.fromType(questionJson));
    }
    return SurveyData(
      questions: questions,
      commonTheme: CommonTheme.fromJson(json['commonTheme']),
    );
  }

  SurveyData copyWith({
    List<QuestionData>? questions,
    CommonTheme? commonTheme,
  }) {
    return SurveyData(
      questions: questions ?? this.questions,
      commonTheme: commonTheme ?? this.commonTheme,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'commonTheme': commonTheme.toJson(),
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }
}
