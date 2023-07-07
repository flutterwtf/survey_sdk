import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/data/mappers/question_types/info_question_data/info_question_data_mapper_ver1.dart';
import 'package:survey_sdk/src/domain/entities/question_types/info_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';

void main() {
  group(
    'Choice question mapper tests',
    () {
      final mapper = InfoQuestionDataMapperVer1();
      const question = InfoQuestionData.common();
      final receivedJson = mapper.toJson(question);

      test(
        'fromJson',
        () {
          final receivedQuestion = mapper.fromJson(receivedJson);

          expect(receivedQuestion.runtimeType, equals(question.runtimeType));
          expect(receivedQuestion, equals(question));
        },
      );

      test(
        'toJson',
        () {
          final json = mapper.toJson(question);

          expect(json, equals(receivedJson));
        },
      );

      test(
        'fromType',
        () {
          final receivedQuestion = QuestionData.fromType(receivedJson, 1);

          expect(receivedQuestion.runtimeType, InfoQuestionData);
          expect(receivedQuestion, equals(question));
        },
      );
    },
  );
}
