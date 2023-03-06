import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/data/filesystem_data_source.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  final FileSystemDataSource _fileSystemDataSource = FileSystemDataSource();
  BuilderCubit()
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
          const IntroQuestionData.common(index: 0),
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
      _fileSystemDataSource.downloadSurveyData(rawMap);
    }
  }

  void select(QuestionData data) => emit(
        state.copyWith(selectedQuestion: data),
      );
}
