import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  BuilderCubit()
      : super(const EditQuestionBuilderState(selectedQuestion: null));

  void select(QuestionData data) =>
      emit(EditQuestionBuilderState(selectedQuestion: data));

  void editCommonTheme() => emit(const EditCommonThemeBuilderState());
}
