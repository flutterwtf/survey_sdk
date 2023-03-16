import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/domain/repository_interfaces/local_storage_data_repository.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  final LocalStorageDataRepository _localStorageDataRepository;
  final SurveyDataRepository _surveyDataRepository;

  BuilderCubit(
    this._localStorageDataRepository,
    this._surveyDataRepository,
  ) : super(
          BuilderState(
            selectedQuestion: null,
            surveyData: SurveyData.common(),
          ),
        ) {
    _init();
  }

  void _init() {
    final surveyData =
        _surveyDataRepository.getSurveyData() ?? SurveyData.common();
    emit(state.copyWith(surveyData: surveyData));
  }

  void select(QuestionData data) => emit(
        state.copyWith(selectedQuestion: data),
      );

  void addQuestionData(QuestionData data) {
    final questionList = List<QuestionData>.from(state.surveyData.questions)
      ..add(data);
    final surveyData = state.surveyData.copyWith(questions: questionList);
    _surveyDataRepository.saveSurveyData(surveyData);
    emit(state.copyWith(surveyData: surveyData));
  }

  // TODO(message): show message in case of error/empty data
  Future<void> importData() async {
    final surveyData = await _localStorageDataRepository.surveyData();
    if (surveyData != null) {
      emit(
        state.copyWith(surveyData: surveyData),
      );
    }
  }
}
