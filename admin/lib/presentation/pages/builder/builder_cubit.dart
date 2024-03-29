import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/domain/repository_interfaces/file_system_repository.dart.dart';
import 'package:survey_admin/domain/repository_interfaces/session_storage_repository.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/common_data.dart';
import 'package:survey_sdk/survey_sdk.dart';

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

  void updateCommonTheme(SurveyData data) {
    _sessionStorageRepository.saveSurveyData(data);
    emit(state.copyWith(surveyData: data));
  }

  void select(QuestionData data) {
    if (state is EditQuestionBuilderState ||
        state is ImportSuccessSurveyDataBuilderState) {
      emit(
        EditQuestionBuilderState(
          selectedIndex: data.index,
          surveyData: state.surveyData,
        ),
      );
    } else if (state is PreviewQuestionBuilderState) {
      emit(
        PreviewQuestionBuilderState(
          surveyData: state.surveyData,
          selectedQuestion: data,
        ),
      );
    }
  }

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

  Future<void> importData() async {
    final selectedIndex = (state is EditQuestionBuilderState)
        ? (state as EditQuestionBuilderState).selectedIndex
        : 1;

    final surveyData = await _fileSystemRepository.importSurveyData();

    if (surveyData != null) {
      emit(
        ImportSuccessSurveyDataBuilderState(surveyData: surveyData),
      );
      select(surveyData.questions.first);
    } else {
      emit(
        ImportErrorSurveyDataBuilderState(surveyData: state.surveyData),
      );
      emit(
        EditQuestionBuilderState(
          selectedIndex: selectedIndex,
          surveyData: state.surveyData,
        ),
      );
    }
  }

  void updateQuestionData(QuestionData data) {
    final questions = List.of(state.surveyData.questions);

    final index = questions.indexWhere(
      (question) => question.index == data.index,
    );
    if (index != -1) questions[index] = data;

    final surveyData = state.surveyData.copyWith(questions: questions);
    _sessionStorageRepository.saveSurveyData(surveyData);
    emit(state.copyWith(surveyData: surveyData));
  }

  void updateQuestions(List<QuestionData> questionList) {
    final surveyData = state.surveyData.copyWith(questions: questionList);
    _sessionStorageRepository.saveSurveyData(surveyData);
    emit(state.copyWith(surveyData: surveyData));
  }

  void openPreviewMode() {
    if (state is! EditQuestionBuilderState) return;

    final index = (state as EditQuestionBuilderState).selectedIndex;
    final selectedQuestion =
        state.surveyData.questions.firstWhereOrNull((e) => e.index == index);

    emit(
      PreviewQuestionBuilderState(
        selectedQuestion: selectedQuestion,
        surveyData: state.surveyData,
      ),
    );
  }

  void openEditMode() {
    if (state is! PreviewQuestionBuilderState) return;

    final selectedIndex =
        (state as PreviewQuestionBuilderState).selectedQuestion?.index ?? 1;

    emit(
      EditQuestionBuilderState(
        selectedIndex: selectedIndex,
        surveyData: state.surveyData,
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
