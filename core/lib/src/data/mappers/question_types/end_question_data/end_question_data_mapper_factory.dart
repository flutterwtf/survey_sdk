import 'package:survey_sdk/src/data/mappers/question_types/end_question_data/end_question_data_mapper_ver1.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';

abstract class EndQuestionDataMapperFactory {
  static final List<QuestionDataMapper> _implementations = [
    /// _implementations contains all versions EndQuestionDataMapper
    EndQuestionDataMapperVer1(),
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
