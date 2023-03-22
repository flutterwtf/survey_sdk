import 'package:equatable/equatable.dart';

class QuestionAnswer<T> extends Equatable {
  final T answer;

  @override
  // TODO: implement props.
  List<Object?> get props => [answer];

  const QuestionAnswer(this.answer);
}
