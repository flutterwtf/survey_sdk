import 'dart:convert';

import 'package:flutter/services.dart';
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
            selectedIndex: 1,
          ),
        ) {
    _init();
  }

  void downloadSurveyData() {
    _fileSystemRepository.downloadSurveyData(state.surveyData.toJson());
  }

  void copySurveyData() {
    final jsonText = jsonEncode(state.surveyData.toJson());
    Clipboard.setData(ClipboardData(text: jsonText));
  }

  void updateCommon(QuestionData data) {
    final surveyData = state.surveyData;
    final common = state.surveyData.commonTheme;
    switch (data.type) {
      case QuestionTypes.choice:
        emit(
          state.copyWith(
            surveyData: surveyData.copyWith(
              commonTheme: common.copyWith(choice: data as ChoiceQuestionData),
            ),
          ),
        );
        break;
      case QuestionTypes.input:
        emit(
          state.copyWith(
            surveyData: surveyData.copyWith(
              commonTheme: common.copyWith(input: data as InputQuestionData),
            ),
          ),
        );
        break;
      case QuestionTypes.intro:
        emit(
          state.copyWith(
            surveyData: surveyData.copyWith(
              commonTheme: common.copyWith(intro: data as IntroQuestionData),
            ),
          ),
        );
        break;
      case QuestionTypes.slider:
        emit(
          state.copyWith(
            surveyData: surveyData.copyWith(
              commonTheme: common.copyWith(slider: data as SliderQuestionData),
            ),
          ),
        );
        break;
    }
  }

  void select(QuestionData data) => emit(
        EditQuestionBuilderState(
          selectedIndex: data.index,
          surveyData: state.surveyData,
        ),
      );

  void deleteQuestionData(QuestionData data) {
    final questionList = List<QuestionData>.of(state.surveyData.questions)
      ..remove(data);

    _updateIndex(questionList);

    final surveyData = state.surveyData.copyWith(questions: questionList);
    _sessionStorageRepository.saveSurveyData(surveyData);
    emit(state.copyWith(surveyData: surveyData));
    if (state.surveyData.questions.isEmpty) {
      emit(
        EditQuestionBuilderState(
          selectedIndex: 0,
          surveyData: state.surveyData,
        ),
      );
    } else {
      select(state.surveyData.questions.first);
    }
  }

  void addQuestionData(QuestionData data) {
    final questionList = List<QuestionData>.of(state.surveyData.questions)
      ..add(data);

    final surveyData = state.surveyData.copyWith(questions: questionList);
    _sessionStorageRepository.saveSurveyData(surveyData);
    emit(state.copyWith(surveyData: surveyData));
    select(state.surveyData.questions.last);
  }

  // TODO(message): show message in case of error/empty data.
  Future<SurveyData?> importData() async {
    final surveyData = await _fileSystemRepository.importSurveyData();
    if (surveyData != null) {
      emit(
        state.copyWith(surveyData: surveyData),
      );
      select(surveyData.questions.first);
    }
    return surveyData;
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

  void updateQuestions(List<QuestionData> questionList) {
    emit(
      state.copyWith(
        surveyData: state.surveyData.copyWith(questions: questionList),
      ),
    );
  }

  void _updateIndex(List<QuestionData> data) {
    for (var i = 0; i < data.length; i++) {
      data[i] = data[i].copyWith(index: i + 1);
    }
  }

  void _init() {
    final surveyData = _sessionStorageRepository.getSurveyData() ??
        i.get<CommonData>().surveyData;
    emit(state.copyWith(surveyData: surveyData));
  }
}
