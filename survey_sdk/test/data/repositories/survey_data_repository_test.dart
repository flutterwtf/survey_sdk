import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_sdk/src/data/repositories/survey_data_repository_impl.dart';

import '../../utils/mocked_entities.dart';
import '../../utils/shared_mocks.mocks.dart';

void main() {
  final mockFilesystemDataSource = MockFilesystemDataSource();
  final surveyDataRepository = SurveyDataRepositoryImpl(
    mockFilesystemDataSource,
  );

  group('test SurveyDataRepository', () {
    when(mockFilesystemDataSource.getSurveyData('data')).thenAnswer(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () => MockedEntities.data1,
      ),
    );

    test('get survey data', () async {
      expect(
        await surveyDataRepository.getSurveyData('data'),
        MockedEntities.data1,
      );
    });
  });
}
