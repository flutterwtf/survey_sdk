import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(),
        );

  void changeTheme(ThemeData themeData) {
    emit(state.copyWith(themeData: themeData));
  }
}
