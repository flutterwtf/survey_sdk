import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_admin/data/repositories/session_storage_repository_impl.dart';

import '../../utils/shared_mocks.mocks.dart';

void main() {
  final mockSessionStorageSource = MockSessionStorageDataSource();
  final mockSurveyData = MockSurveyData();
  final sessionStorageRepository =
      SessionStorageRepositoryImpl(mockSessionStorageSource);
  MockSurveyData? savedData;

  group('test SessionStorageRepositoryImpl', () {
    when(
      mockSessionStorageSource.saveSurveyData(mockSurveyData),
    )
    .thenAnswer(
      (_) => savedData = mockSurveyData,
    );

    when(
      mockSessionStorageSource.getSurveyData(),
    )
    .thenAnswer(
      (_) => mockSurveyData,
    );
      

    test('get survey data', () {
      final surveyData = mockSessionStorageSource.getSurveyData();
      expect(surveyData, mockSurveyData);
    });

    test('save survey data', () {
      sessionStorageRepository.saveSurveyData(mockSurveyData);
      expect(savedData, mockSurveyData);
    });
  });
}
