import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/data/data_sources/filesystem_data_source.dart';
import 'package:survey_core/src/data/data_sources/interfaces/filesystem_data_source.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  FilesystemDataSource dataSource = FilesystemDataSourceImpl();

  group('getSurveyData method', () {
    test('Call with empty parameter', () {
      expect(
        () => dataSource.getSurveyData(''),
        throwsAssertionError,
      );
    });

    test('Call with bad parameter', () async {
      expect(
        () => dataSource.getSurveyData('bad asset'),
        throwsFlutterError,
      );
    });

    test('Call with good parameter', () async {
      // This line should not throw exceptions
      await dataSource.getSurveyData(
        'test/assets/test_survey_data.json',
      );

      // TODO compare SurveyData from assets with mock SurveyData
    });
  });
}
