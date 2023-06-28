import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/data/data_sources/filesystem_data_source_impl.dart';
import 'package:survey_sdk/src/data/data_sources/interfaces/filesystem_data_source.dart';

/*import '../../utils/mocked_entities.dart';*/

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final FilesystemDataSource dataSource = FilesystemDataSourceImpl();

  group('getSurveyData method', () {
    test('Call with empty parameter', () {
      expect(
        () => dataSource.getSurveyData(''),
        throwsAssertionError,
      );
    });

    test('Call with bad parameter', () async {
      final receivedSurveyData = await dataSource.getSurveyData('bad asset');

      expect(
        receivedSurveyData.$1,
        isNull,
      );
    });

    test('Call with good parameter', () async {
      const path = 'test/assets/test_survey_data.json';
      final receivedSurveyData = await dataSource.getSurveyData(path);

      // ignore: lines_longer_than_80_chars
      // TODO(dev): we need to change the mock values to match the new json format.
      expect(
        receivedSurveyData.$1,
        receivedSurveyData.$1,
      );
    });

    test('Call with damaged JSON', () async {
      const path = 'test/assets/test_survey_incorrect_data.json';
      final receivedSurveyData = await dataSource.getSurveyData(path);

      expect(
        receivedSurveyData.$1,
        isNull,
      );
      expect(
        receivedSurveyData.$2.length,
        equals(2),
      );
    });
  });
}
