import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_core/src/data/repositories/survey_data_repository.dart';

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
        () => MockedSurveyData.data1,
      ),
    );

    test('get survey data', () async {
      expect(
        await surveyDataRepository.getSurveyData('data'),
        MockedSurveyData.data1,
      );
    });
  });
}
