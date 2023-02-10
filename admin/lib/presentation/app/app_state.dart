import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  final ThemeData themeData;

  const AppState({
    required this.themeData,
  });

  AppState copyWith({ThemeData? themeData}) {
    return AppState(
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object?> get props => [themeData];
}