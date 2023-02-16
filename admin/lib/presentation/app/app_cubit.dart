import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/survey_core.dart';

import 'package:survey_sdk/domain/data_interfaces/locale_repository.dart';
import 'package:survey_sdk/domain/data_interfaces/theme_repository.dart';
import 'package:core/core.dart';
import 'package:survey_sdk/presentation/app/app_state.dart';
import 'package:survey_sdk/presentation/base/base_cubit.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          AppState(
            themeData: ThemeData(
              extensions: [
                SurveySliderThemeData.common(),
              ],
            ),
          ),
        );

  void changeTheme(ThemeData themeData) {
    emit(state.copyWith(themeData: themeData));
  }
}
