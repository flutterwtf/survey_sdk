import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  BuilderCubit()
      : super(
          const BuilderState(
            selectedQuestion: null,
            questions: [
              IntroQuestionData.common(index: 0),
              IntroQuestionData.common(index: 1),
            ],
          ),
        );

  void select(QuestionData data) => emit(
        state.copyWith(selectedQuestion: data),
      );

  void add(QuestionData data) {
    emit(
      state.copyWith(
        questions: [
          ...state.questions,
          data.copyWith(index: state.questions.length),
        ],
      ),
    );
  }

  void swapQuestions(int firstIndex, int secondIndex) {
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

  void updateSelectedQuestion(QuestionData question) => emit(
        state.copyWith(selectedQuestion: question),
      );

  void updateSelectedQuestionWithTitle(String title) {
    updateSelectedQuestion(
      state.selectedQuestion!.copyWith(title: title),
    );
  }

  void updateSelectedQuestionWithSubtitle(String subtitle) {
    updateSelectedQuestion(
      state.selectedQuestion!.copyWith(subtitle: subtitle),
    );
  }

  void updateSelectedQuestionWithHint({
    required String hint,
    required String type,
  }) {}

  void updateSelectedQuestionWithButtonText({
    required String text,
    required String type,
  }) {
  }
}
