import 'package:equatable/equatable.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';

abstract class QuestionData<T> extends Equatable with ApiObject {
  final int index;
  final String title;
  final String subtitle;
  final String? content;
  final bool isSkip;

  const QuestionData({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.isSkip,
    this.content,
  });

  QuestionData copyWith({
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
  });

  T? get theme;

  String get type;

  // TODO(dev): to constants maybe?
  static QuestionData fromType(Map<String, dynamic> json) {
    switch (json['typeQuestion']) {
      case 'Slider':
        return SliderQuestionData.fromJson(json);
      case 'Intro':
        return IntroQuestionData.fromJson(json);
      case 'Input':
        return InputQuestionData.fromJson(json);
      case 'Choice':
        return ChoiceQuestionData.fromJson(json);
      default:
        throw Exception('Unimplemented error');
    }
  }
}
