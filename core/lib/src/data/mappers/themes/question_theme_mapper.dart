abstract class QuestionThemeMapper<T> {
  final int version = 1;
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T theme);
}
