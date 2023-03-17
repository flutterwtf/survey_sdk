import 'package:equatable/equatable.dart';

class QuestionAnswer extends Equatable {
  final dynamic answer;

  const QuestionAnswer(this.answer);

  @override
  // TODO: implement props
  List<Object?> get props => [answer];
}
