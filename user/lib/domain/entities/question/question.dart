import 'package:survey_sdk/domain/entities/question_types/type_question.dart';

class Question {
  final TypeQuestion question;
  final String answer;

  Question({required this.question, required this.answer});
}