import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';
import 'package:survey_sdk/src/data/mappers/themes/slider_question_theme/slider_question_theme_mapper_ver_1.dart';

abstract class SliderQuestionThemeMapperFactory {
  /// _implementations contains all versions SliderQuestionThemeMapper
  static final List<QuestionThemeMapper> _implementations = [
    SliderQuestionThemeMapperVer1(),
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
