import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final QuestionData? selected;

  const BuilderState({required this.selected});

  BuilderState copyWith({QuestionData? data}) {
    return BuilderState(selected: data ?? selected);
  }

  @override
  List<Object?> get props => [selected];
}
