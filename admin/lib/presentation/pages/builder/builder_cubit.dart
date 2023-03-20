import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/domain/repository_interfaces/file_system_repository.dart.dart';
import 'package:survey_admin/domain/repository_interfaces/session_storage_repository.dart';
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
            surveyData: SurveyData(
              questions: [],
              commonTheme: CommonData.commonTheme,
            ),
            selectedQuestion: null,
          ),
        ) {
    _init();
  }

  void select(QuestionData data) => emit(
        EditQuestionBuilderState(
          selectedQuestion: data,
          surveyData: state.surveyData,
        ),
      );

  void editCommonTheme() =>
      emit(EditCommonThemeBuilderState(surveyData: state.surveyData));

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

  Future<void> _init() async {
    final surveyData = _sessionStorageRepository.getSurveyData() ??
        await CommonData.surveyData;
    emit(state.copyWith(surveyData: surveyData));
  }
}
