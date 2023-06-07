import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:survey_sdk/src/data/repositories/survey_data_repository_impl.dart';

import '../../utils/mocked_entities.dart';

// ignore: prefer-match-file-name
class MockSurveyDataRepository extends Mock
    implements SurveyDataRepositoryImpl {}

void main() {
  final surveyRepository = MockSurveyDataRepository();

  group('test SurveyDataRepository', () {
    when(() => surveyRepository.getSurveyData('data')).thenAnswer(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () => (MockedEntities.data1, <String>['f']),
      ),
    );

    test('get survey data', () async {
      final receivedSurveyData = await surveyRepository.getSurveyData('data');

      expect(
        receivedSurveyData.$1,
        MockedEntities.data1,
      );
    });
  });
}
