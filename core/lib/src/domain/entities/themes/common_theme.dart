import 'package:flutter/material.dart';
import 'package:survey_core/src/data/mappers/slider_theme_data_mapper.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/themes/text_field_theme_data.dart';

class CommonTheme extends ApiObject {
  final SliderThemeData sliderThemeData;
  final TextFieldThemeData textFieldThemeData;

  CommonTheme({
    required this.textFieldThemeData,
    required this.sliderThemeData,
  });

  ThemeData toThemeData() {
    return ThemeData(
      sliderTheme: sliderThemeData,
      extensions: [textFieldThemeData],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'sliderThemeData': sliderThemeData.toJson(),
        'textFieldThemeData': textFieldThemeData.toJson(),
      };

  factory CommonTheme.fromJson(Map<String, dynamic> json) {
    return CommonTheme(
      textFieldThemeData: TextFieldThemeData.fromJson(
        json['textFieldThemeData'],
      ),
      sliderThemeData: SliderThemeDataMapper.fromJson(
        json['sliderThemeData'],
      ),
    );
  }

  // TODO(dev): implement props
  List<Object?> get props => [
        sliderThemeData,
        textFieldThemeData,
      ];
}
