import 'package:equatable/equatable.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';

//TODO make immutable?
abstract class QuestionData<T> extends Equatable with ApiObject {
  int index;
  final String title;
  final String subtitle;
  final String? content;
  final bool isSkip;

  QuestionData({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.isSkip,
    this.content,
  });

  T? get theme;
  String get type;

  static QuestionData fromType(Map<String, dynamic> json) {
    switch (json['type']) {
      case QuestionTypes.slider:
        return SliderQuestionData.fromJson(json);
      case QuestionTypes.intro:
        return IntroQuestionData.fromJson(json);
      case QuestionTypes.input:
        return InputQuestionData.fromJson(json);
      case QuestionTypes.choice:
        return ChoiceQuestionData.fromJson(json);
      default:
        throw Exception('Unimplemented error');
    }
  }
}
