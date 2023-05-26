import 'package:survey_sdk/src/data/mappers/question_types/question_data_mapper.dart';

abstract class QuestionDataMapperVer1<T> extends QuestionDataMapper<T> {
  static int jsonVersion = 1;
}
