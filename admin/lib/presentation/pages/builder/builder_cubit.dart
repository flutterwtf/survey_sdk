import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  final SurveyDataRepository _surveyDataRepository;

  BuilderCubit(this._surveyDataRepository)
      : super(
          const BuilderState(selectedQuestion: null, surveyData: null),
        );

  void select(QuestionData data) => emit(
        state.copyWith(selectedQuestion: data),
      );

  Future<void> importData() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final bytes = result.files.single.bytes;
      if (bytes != null) {
        final json = const Utf8Decoder().convert(bytes);
        final surveyData = _surveyDataRepository.getSurveyDataFromJson(json);
        emit(
          state.copyWith(surveyData: surveyData),
        );
      }
    }
  }
}
