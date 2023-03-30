import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_colors.dart';

extension TextSelectionThemeDataMapper on TextSelectionThemeData {
  Map<String, dynamic> toJson() => {
        'selectionColor': selectionColor?.value ?? AppColors.selectionColor,
      };

  static TextSelectionThemeData fromJson(Map<String, dynamic> json) =>
      TextSelectionThemeData(
        selectionColor: Color(json['selectionColor']),
      );
}
