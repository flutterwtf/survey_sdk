import 'package:survey_core/src/domain/entities/api_object.dart';

class QuestionAnswer extends ApiObject {
  final int index;
  final dynamic answer;

  QuestionAnswer(this.index, this.answer);

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'answer': answer,
      };
}
