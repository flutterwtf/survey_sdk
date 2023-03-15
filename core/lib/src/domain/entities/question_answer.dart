import 'package:survey_core/src/domain/entities/constants/question_types.dart';

abstract class QuestionAnswer<T>{
  QuestionAnswer(this.index, this.content);

  final int index;
  final String? content;

  static QuestionAnswer toJson() {
    switch ('type') {
      case QuestionTypes.slider:
        return toJson();
      case QuestionTypes.intro:
        return toJson();
      case QuestionTypes.input:
        return toJson();
      case QuestionTypes.choice:
        return toJson();
      default:
        throw Exception('Unimplemented error');
    }
  }
}
