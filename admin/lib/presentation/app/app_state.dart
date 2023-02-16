import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AppState extends Equatable {
  final ThemeType themeType;
  final Locale? locale;

  const AppState({
    required this.themeType,
    required this.locale,
  });

  AppState copyWith({
    Locale? locale,
    ThemeType? themeType,
  }) {
    return AppState(
      themeType: themeType ?? this.themeType,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [themeType, locale];
}