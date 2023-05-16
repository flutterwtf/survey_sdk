abstract class QuestionThemeMapper<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T theme);
}
