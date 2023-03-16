import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  BuilderCubit()
      : super(
          const BuilderState(
            selectedQuestionId: 0,
            questions: [
              IntroQuestionData.common(index: 1),
              IntroQuestionData.common(index: 2),
            ],
          ),
        );

  void select(int id) => emit(
        state.copyWith(selectedQuestionId: id),
      );

  void add(QuestionData questionData) {
    emit(
      state.copyWith(
        questions: [
          ...state.questions,
          questionData.copyWith(index: state.questions.length),
        ],
      ),
    );
  }

  void swapQuestions(int a, int b) {
    final firstIndex = a;
    var secondIndex = b;
    if (secondIndex > firstIndex) secondIndex--;

    final firstItem = state.questions[firstIndex];
    final secondItem = state.questions[secondIndex];
    final questions = [...state.questions];

    questions[firstIndex] = secondItem.copyWith(index: firstIndex);
    questions[secondIndex] = firstItem.copyWith(index: secondIndex);

    emit(
      state.copyWith(
        questions: questions,
      ),
    );
  }

  void updateSelectedQuestion(QuestionData question) {
    if (state.selectedQuestionId != null) {
      final questions = [...state.questions];
      questions[state.selectedQuestionId!] = question;
      emit(
        state.copyWith(
          questions: questions,
        ),
      );
    }
  }
}
