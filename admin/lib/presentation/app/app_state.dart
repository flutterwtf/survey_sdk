import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  @override
  List<Object?> get props => [];

  const AppState();

  AppState copyWith({ThemeData? themeData}) {
    return const AppState();
  }
}
