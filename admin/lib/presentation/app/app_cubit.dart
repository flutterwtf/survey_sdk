import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/survey_core.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          AppState(
            themeData: ThemeData(
              extensions: const [
                SurveySliderTheme.common(),
              ],
            ),
          ),
        );

  void changeTheme(ThemeData themeData) {
    emit(state.copyWith(themeData: themeData));
  }
}
