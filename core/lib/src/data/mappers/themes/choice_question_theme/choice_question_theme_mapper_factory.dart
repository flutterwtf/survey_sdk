import 'package:survey_sdk/src/data/mappers/themes/choice_question_theme/choice_question_theme_mapper_ver_1.dart';
import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';

abstract class ChoiceQuestionThemeMapperFactory {
  /// _implementations contains all versions ChoiceQuestionThemeMapper
  static final List<QuestionThemeMapper> _implementations = [
    ChoiceQuestionThemeMapperVer1(),
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
