import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/domain/repository_interfaces/file_system_repository.dart.dart';
import 'package:survey_admin/domain/repository_interfaces/session_storage_repository.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/common_data.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  final FileSystemRepository _fileSystemRepository;
  final SessionStorageRepository _sessionStorageRepository;

  BuilderCubit(
    this._fileSystemRepository,
    this._sessionStorageRepository,
  ) : super(
          EditQuestionBuilderState(
            surveyData: i.get<CommonData>().surveyData,
            selectedQuestion: null,
            commonChoice: const ChoiceQuestionData.common(),
            commonInput: InputQuestionData.common(),
            commonIntro: IntroQuestionData.common(),
            commonSlider: const SliderQuestionData.common(),
          ),
        ) {
    _init();
  }

  void downloadExportedQuestions() {
    final questions = state.surveyData.questions;
    if (questions.isNotEmpty) {
      final rawMap = <String, dynamic>{};
      for (final element in questions) {
        rawMap[element.index.toString()] = element.toJson();
      }
      _fileSystemRepository.downloadSurveyData(rawMap);
    }
  }

  void updateCommon(QuestionData data) {
    switch (data.type) {
      case QuestionTypes.choice:
        emit(state.copyWith(commonChoice: data as ChoiceQuestionData));
        break;
      case QuestionTypes.input:
        emit(state.copyWith(commonInput: data as InputQuestionData));
        break;
      case QuestionTypes.intro:
        emit(state.copyWith(commonIntro: data as IntroQuestionData));
        break;
      case QuestionTypes.slider:
        emit(state.copyWith(commonSlider: data as SliderQuestionData));
        break;
    }
  }

  void select(QuestionData data) => emit(
        EditQuestionBuilderState(
          selectedQuestion: data,
          surveyData: state.surveyData,
          commonChoice: state.commonChoice,
          commonInput: state.commonInput,
          commonIntro: state.commonIntro,
          commonSlider: state.commonSlider,
        ),
      );

  void addQuestionData(QuestionData data) {
    final questionList = List<QuestionData>.of(state.surveyData.questions)
      ..add(data);
    final surveyData = state.surveyData.copyWith(questions: questionList);
    _sessionStorageRepository.saveSurveyData(surveyData);
    emit(state.copyWith(surveyData: surveyData));
  }

  // TODO(message): show message in case of error/empty data.
  Future<void> importData() async {
    final surveyData = await _fileSystemRepository.importSurveyData();
    if (surveyData != null) {
      emit(
        state.copyWith(surveyData: surveyData),
      );
    }
  }

  void updateQuestionData(QuestionData data) {
    final questions = List.of(state.surveyData.questions);
    // TODO(dev): Rewrite index system maybe?
    questions[data.index - 1] = data;
    emit(
      state.copyWith(
        surveyData: state.surveyData.copyWith(questions: questions),
      ),
    );
  }

  void updateTheme(CommonTheme theme) {
    emit(
      state.copyWith(
        surveyData: state.surveyData.copyWith(commonTheme: theme),
      ),
    );
  }

  void _init() {
    final surveyData = _sessionStorageRepository.getSurveyData() ??
        i.get<CommonData>().surveyData;
    emit(state.copyWith(surveyData: surveyData));
  }
}
