import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_core/src/data/repositories/survey_data_repository.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/entities/themes/common_theme.dart';
import 'package:survey_core/src/domain/entities/themes/text_field_theme_data.dart';
import '../utils/shared_mocks.mocks.dart';

void main() {
  final mockFilesystemDataSource = MockFilesystemDataSource();
  final surveyDataRepo = SurveyDataRepositoryImpl(mockFilesystemDataSource);
  final mockSurveyData = SurveyData(
    questions: [],
    commonTheme: CommonTheme(
      sliderThemeData: const SliderThemeData(),
      textFieldThemeData: const TextFieldThemeData.common(),
    ),
  );

  group(
    'survey data repository test',
    () {
      test(
        'get survey data',
        () async {
          when(mockFilesystemDataSource.getSurveyData('asset'))
              .thenAnswer((_) => Future.value(mockSurveyData));
          expect(await surveyDataRepo.getSurveyData('asset'), mockSurveyData);
        },
      );
    },
  );
}
