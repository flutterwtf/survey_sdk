import 'package:equatable/equatable.dart';

/// Represents a question answer or multiple answers.
class QuestionAnswer<T> extends Equatable {
  /// Answer to the question.
  final T answer;

  @override
  List<Object?> get props => [answer];

  const QuestionAnswer(this.answer);
}
