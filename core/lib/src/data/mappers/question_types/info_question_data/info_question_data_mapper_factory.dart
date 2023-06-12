import 'package:survey_sdk/src/data/mappers/question_types/info_question_data/info_question_data_mapper_ver1.dart';
import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';

abstract class InfoQuestionDataMapperFactory {
  static final List<QuestionDataMapper> _implementations = [
    /// _implementations contains all versions InfoQuestionDataMapper
    InfoQuestionDataMapperVer1(),
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
