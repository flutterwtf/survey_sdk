import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/domain/repository_interfaces/local_storage_data_repository.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  final LocalStorageDataRepository _localStorageDataRepository;

  BuilderCubit(
    this._localStorageDataRepository,
  ) : super(
          const BuilderState(selectedQuestion: null, questions: []),
        );

  void select(QuestionData data) => emit(
        state.copyWith(selectedQuestion: data),
      );

  Future<void> importData() async {
    final surveyData = await _localStorageDataRepository.surveyData();
    if (surveyData != null) {
      final questions = surveyData.questions;
      emit(
        state.copyWith(questions: questions),
      );
    }
  }
}
