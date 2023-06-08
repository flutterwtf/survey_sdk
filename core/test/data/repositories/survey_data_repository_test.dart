import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/data/data_sources/filesystem_data_source_impl.dart';
import 'package:survey_sdk/src/data/repositories/survey_data_repository_impl.dart';
import 'package:survey_sdk/src/domain/entities/survey_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final surveyDataSource = FilesystemDataSourceImpl();
  final surveyRepository = SurveyDataRepositoryImpl(surveyDataSource);

  const pathWithCorrectJson = 'test/assets/test_survey_data.json';
  const pathWithIncorrectJson = 'test/assets/test_survey_incorrect_data.json';

  group('test SurveyDataRepository', () {
    test(
      'getSurveyData should receive correct data when json is correct',
      () async {
        final receivedSurveyData = await surveyRepository.getSurveyData(
          pathWithCorrectJson,
        );

        expect(receivedSurveyData.$1 is SurveyData, isTrue);
        expect(receivedSurveyData.$2.isEmpty, isTrue);
      },
    );

    test(
      'getSurveyData should receive correct data when json is incorrect',
      () async {
        final receivedSurveyData = await surveyRepository.getSurveyData(
          pathWithIncorrectJson,
        );

        expect(receivedSurveyData.$1, isNull);
        expect(receivedSurveyData.$2.length, equals(2));
      },
    );

    test(
      'getSurveyData should receive correct data when path is incorrect',
      () async {
        final receivedSurveyData = await surveyRepository.getSurveyData(
          'incorrect_path',
        );

        expect(receivedSurveyData.$1, isNull);
        expect(
          receivedSurveyData.$2.length,
          equals(2),
        );
      },
    );
  });
}
