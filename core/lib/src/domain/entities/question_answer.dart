class QuestionAnswer<T> {
  final int index;
  final T? answer;

  const QuestionAnswer(this.index, this.answer);

  Map<String, dynamic> toJson() => {
        'index': index,
        'answer': answer,
      };
}
