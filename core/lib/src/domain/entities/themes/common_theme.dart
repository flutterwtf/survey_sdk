import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/data/mappers/slider_theme_data_mapper.dart';
import 'package:survey_core/src/data/mappers/text_selection_theme_data_mapper.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/themes/text_field_theme_data.dart';

/// Defines the theme for the entire app
class CommonTheme extends ApiObject with EquatableMixin {
  /// Holds the color, shape, and typography values for a Material Design
  /// slider theme
  final SliderThemeData sliderThemeData;

  /// Defines the theme for text fields throughout the app
  final TextFieldThemeData textFieldThemeData;

  /// Defines the visual properties needed for text selection in TextField
  final TextSelectionThemeData textSelectionThemeData;

  @override
  List<Object?> get props => [
        sliderThemeData,
        textFieldThemeData,
        textSelectionThemeData,
      ];

  CommonTheme({
    required this.textFieldThemeData,
    required this.sliderThemeData,
    required this.textSelectionThemeData,
  });

  factory CommonTheme.fromJson(Map<String, dynamic> json) {
    return CommonTheme(
      textFieldThemeData: TextFieldThemeData.fromJson(
        json['textFieldThemeData'],
      ),
      sliderThemeData: SliderThemeDataMapper.fromJson(
        json['sliderThemeData'],
      ),
      textSelectionThemeData: TextSelectionThemeDataMapper.fromJson(
        json['textSelectionThemeData'],
      ),
    );
  }

  ThemeData toThemeData() {
    return ThemeData(
      sliderTheme: sliderThemeData,
      extensions: [textFieldThemeData],
      textSelectionTheme: textSelectionThemeData,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'sliderThemeData': sliderThemeData.toJson(),
        'textFieldThemeData': textFieldThemeData.toJson(),
        'textSelectionThemeData': textSelectionThemeData.toJson(),
      };
}
