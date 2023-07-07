import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/data/mappers/actions/finish_survey_action/finish_survey_action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';

void main() {
  group(
    'GoNextActionMapper tests',
    () {
      final mapper = FinishSurveyActionMapper();
      const object = FinishSurveyAction();
      final receivedJson = {
        'type': 'FinishSurvey',
      };

      test(
        'fromJson method',
        () {
          final action = mapper.fromJson(receivedJson);

          expect(action, equals(object));
        },
      );

      test(
        'toJson method',
        () {
          final json = mapper.toJson(object);

          expect(json, equals(receivedJson));
        },
      );

      test(
        'fromType',
        () {
          final action = SurveyAction.fromType(receivedJson);

          expect(action.runtimeType, FinishSurveyAction);
          expect(action, equals(object));
        },
      );

      test(
        'toJsonByType',
        () {
          final json = SurveyAction.toJsonByType(object);

          expect(json, equals(receivedJson));
        },
      );
    },
  );
}
