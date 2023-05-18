import 'package:equatable/equatable.dart';

/// Represents a question answer or multiple answers.
class QuestionAnswer<T> extends Equatable {
  /// Answer to the question.
  final T answer;

  @override
  // TODO(dev): implement props.
  List<Object?> get props => [answer];

  const QuestionAnswer(this.answer);
}
