import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:survey_sdk/domain/entities/theme_type.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required ThemeType themeType,
    required Locale? locale,
  }) = _AppState;
}


