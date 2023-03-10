import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  final SurveyDataRepository _surveyDataRepository;

  BuilderCubit(this._surveyDataRepository)
      : super(
          const BuilderState(
            questionsList: [],
            selectedQuestion: null,
          ),
        );

  void setInitialQuestions() {
    emit(
      state.copyWith(
        questionsList: [
          const IntroQuestionData.common(),
          const InputQuestionData.common(index: 1),
        ],
      ),
    );
  }

  void downloadExportedQuestions() {
    if (state.questionsList.isNotEmpty) {
      final rawMap = <String, dynamic>{};
      for (final element in state.questionsList) {
        rawMap[element.index.toString()] = element.toJson();
      }
      _surveyDataRepository.downloadSurveyData(rawMap);
    }
  }

  void select(QuestionData data) => emit(
        state.copyWith(selectedQuestion: data),
      );
}
