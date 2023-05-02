import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_admin/data/repositories/file_system_repository_impl.dart';

import '../../utils/shared_mocks.mocks.dart';

void main() {
  final mockFilesystemDataSource = MockFilesystemDataSource();
  final mockSurveyData = MockSurveyData();
  final surveyDataRepository =
      FileSystemRepositoryImpl(mockFilesystemDataSource);
  var surveyData = <String, dynamic>{};

  group('test SurveyDataRepository', () {
    when(
      mockFilesystemDataSource.downloadSurveyData({'test': 'test'}),
    )
    .thenAnswer(
      (_) => surveyData = {'test': 'test'},
    );

    when(
      mockFilesystemDataSource.importSurveyData(),
    )
    .thenAnswer(
      (_) => Future.value(mockSurveyData),
    );
      

    test('get survey data', () {
      surveyDataRepository.downloadSurveyData({'test': 'test'});
      expect(surveyData, {'test': 'test'});
    });

    test('import survey data', () async {
      final surveyData = await surveyDataRepository.importSurveyData();
      expect(surveyData, mockSurveyData);
    });
  });
}
