import 'package:equatable/equatable.dart';

class QuestionAnswer<T> extends Equatable {
  final T answer;

  const QuestionAnswer(this.answer);

  @override
  // TODO: implement props
  List<Object?> get props => [answer];
}
