import 'package:survey_sdk/src/data/mappers/themes/end_question_theme/end_question_theme_mapper_ver_1.dart';
import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';

abstract class EndQuestionThemeMapperFactory {
  /// _implementations contains all versions EndQuestionThemeMapper
  static final List<QuestionThemeMapper> _implementations = [
    EndQuestionThemeMapperVer1(),
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
