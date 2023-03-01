import 'package:equatable/equatable.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
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

  //TODO: to constants maybe?
  static QuestionData fromType(Map<String, dynamic> json) {
    switch(json['typeQuestion']) {
      case 'Slider': return SliderQuestionData.fromJson(json);
      case 'Intro': return IntroQuestionData.fromJson(json);
      case 'Input': return InputQuestionData.fromJson(json);
      case 'Choice': return ChoiceQuestionData.fromJson(json);
      default: throw Exception('Unimplemented error');
    }
  }
}
