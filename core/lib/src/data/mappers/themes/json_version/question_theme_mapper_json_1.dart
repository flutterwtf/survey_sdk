import 'package:survey_sdk/src/data/mappers/themes/question_theme_mapper.dart';

abstract class QuestionThemeMapperJson1<T> extends QuestionThemeMapper<T> {
  @override
  int get jsonVersion => 1;
}
