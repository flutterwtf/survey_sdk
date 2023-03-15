import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_admin/data/repositories/survey_data_repository.dart';

import '../../utils/shared_mocks.mocks.dart';

void main() {
  final mockFilesystemDataSource = MockFilesystemDataSource();
  final surveyDataRepository =
      SurveyDataRepositoryImpl(mockFilesystemDataSource);
  var surveyData = <String, dynamic>{};

  group('test SurveyDataRepository', () {
    when(mockFilesystemDataSource.downloadSurveyData({'test': 'test'}))
        .thenAnswer(
      (_) => surveyData = {'test': 'test'},
    );

    test('get survey data', () async {
      surveyDataRepository.downloadSurveyData({'test': 'test'});
      expect(surveyData, {'test': 'test'});
    });
  });
}
