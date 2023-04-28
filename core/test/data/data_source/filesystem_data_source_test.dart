import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/data/data_sources/filesystem_data_source_impl.dart';
import 'package:survey_core/src/data/data_sources/interfaces/filesystem_data_source.dart';

import '../../utils/mocked_entities.dart';

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

    test('Call with bad parameter', () {
      expect(
        () => dataSource.getSurveyData('bad asset'),
        throwsFlutterError,
      );
    });

    test('Call with good parameter', () async {
      const path = 'test/assets/test_survey_data.json';
      final mockedSurveyData = jsonEncode(MockedEntities.data1.toJson());
      await File(path).writeAsString(mockedSurveyData);

      expect(
        await dataSource.getSurveyData(path),
        MockedEntities.data1,
      );
    });
  });
}
