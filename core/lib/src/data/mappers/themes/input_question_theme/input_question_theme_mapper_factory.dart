import 'package:survey_sdk/src/data/mappers/themes/input_question_theme/input_question_theme_mapper_ver_1.dart';
import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';

abstract class InputQuestionThemeMapperFactory {
  /// _implementations contains all versions InputQuestionThemeMapper
  static final List<QuestionThemeMapper> _implementations = [
    InputQuestionThemeMapperVer1(),
  ];
  static QuestionThemeMapper getMapper(int version) {
    for (var i = version; i > 0; i--) {
      if (_implementations.any((dataMapper) => dataMapper.jsonVersion == i)) {
        return _implementations.singleWhere(
          (dataMapper) => dataMapper.jsonVersion == i,
        );
      }
    }
    throw UnimplementedError();
  }
}
