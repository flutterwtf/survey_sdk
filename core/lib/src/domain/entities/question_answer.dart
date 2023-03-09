abstract class QuestionAnswer<T> {
  Map<String, dynamic> toJson(String key, T data);
}

class SliderQuestionAnswer extends QuestionAnswer<double> {
  @override
  Map<String, dynamic> toJson(String key, double data) {
    return {
      'index': key,
      'data': data,
    };
  }
}

class InputQuestionAnswer extends QuestionAnswer<String> {
  @override
  Map<String, dynamic> toJson(String key, String data) {
    return {
      'index': key,
      'data': data,
    };
  }
}

class ChoiceQuestionAnswer extends QuestionAnswer<List<String>> {
  @override
  Map<String, dynamic> toJson(String key, List<String> data) {
    return {
      'index': key,
      'data': data,
    };
  }
}
