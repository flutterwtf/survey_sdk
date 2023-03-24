import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/data/data_sources/filesystem_data_source_impl.dart';
import 'package:survey_core/src/data/data_sources/interfaces/filesystem_data_source.dart';

import '../../utils/mocked_entities.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final FilesystemDataSource dataSource = FilesystemDataSourceImpl();
  const surveyAssetsPath = 'test/assets/test_survey_data.json';

  group('getSurveyData method', () {
    test('Call with empty parameter', () {
      expect(
        () => dataSource.getSurveyData(''),
        throwsAssertionError,
      );
    });

    test('Call with bad parameter', () {
      expect(
        () => dataSource.getSurveyData('bad asset'),
        throwsFlutterError,
      );
    });

    test('Call with good parameter', () async {
      final surveyData = await dataSource.getSurveyData(surveyAssetsPath);

      expect(
        surveyData.questions.first.index,
        equals(MockedEntities.data2.questions.first.index),
      );
    });
  });
}
