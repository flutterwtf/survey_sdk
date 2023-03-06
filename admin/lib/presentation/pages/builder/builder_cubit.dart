import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  BuilderCubit()
      : super(
          const BuilderState(selectedQuestion: null),
        );

  void select(QuestionData data) => emit(
        state.copyWith(selectedQuestion: data),
      );
}
