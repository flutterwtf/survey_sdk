import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';

abstract class QuestionData<T> implements ApiObject {
  final int id;
  final String title;
  final String subtitle;
  final String? info;
  final String typeQuestion;
  final bool isSkip;

  const QuestionData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.typeQuestion,
    required this.isSkip,
    this.info,
  });

  T? get theme;
  String get type;

  static QuestionData fromType(Map<String, dynamic> json) {
    switch(json['type']) {
      case 'Slider': return SliderQuestionData.fromJson(json);
      case 'Intro': return IntroQuestionData.fromJson(json);
      case 'Input': return InputQuestionData.fromJson(json);
      case 'Choice': return ChoiceQuestionData.fromJson(json);
      default: throw Exception('Unimplemented error');
    }
  }
}
