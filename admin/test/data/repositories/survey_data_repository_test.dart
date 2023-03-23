import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_admin/data/repositories/file_system_repository_impl.dart';

import '../../utils/shared_mocks.mocks.dart';

void main() {
  final mockFilesystemDataSource = MockFilesystemDataSource();
  final surveyDataRepository =
      FileSystemRepositoryImpl(mockFilesystemDataSource);
  var surveyData = <String, dynamic>{};

  group('test SurveyDataRepository', () {
    when(mockFilesystemDataSource.downloadSurveyData({'test': 'test'}))
        .thenAnswer(
      (_) => surveyData = {'test': 'test'},
    );

    test('get survey data', () {
      surveyDataRepository.downloadSurveyData({'test': 'test'});
      expect(surveyData, {'test': 'test'});
    });
  });
}
