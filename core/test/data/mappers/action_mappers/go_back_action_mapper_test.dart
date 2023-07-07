import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/data/mappers/actions/go_back_action/go_back_action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_back_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';

void main() {
  group(
    'GoBackActionMapper tests',
        () {
      final mapper = GoBackActionMapper();
      const object = GoBackAction();
      final receivedJson = {
        'type': 'GoBack',
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

          expect(action.runtimeType, GoBackAction);
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
