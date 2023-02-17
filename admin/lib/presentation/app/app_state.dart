import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  const AppState();

  AppState copyWith({ThemeData? themeData}) {
    return const AppState();
  }

  @override
  List<Object?> get props => [];
}
