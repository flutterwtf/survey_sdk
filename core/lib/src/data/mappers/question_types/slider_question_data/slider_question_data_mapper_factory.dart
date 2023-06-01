import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';
import 'package:survey_sdk/src/data/mappers/question_types/slider_question_data/slider_question_data_mapper_ver1.dart';

abstract class SliderQuestionDataMapperFactory {
  static final List<QuestionDataMapper> _implementations = [
    /// _implementations contains all versions SliderQuestionDataMapper
    SliderQuestionDataMapperVer1(),
  ];
  static QuestionDataMapper getMapper(int version) {
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
