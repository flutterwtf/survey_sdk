import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';

@immutable
class SurveySliderThemeData extends ThemeExtension<SurveySliderThemeData> with ApiObject {
  final SliderThemeData themeData;

  const SurveySliderThemeData({
    required this.themeData,
  });

  SurveySliderThemeData.common()
      : this(
          themeData: const SliderThemeData(
            thumbColor: Colors.black,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            trackHeight: 8.0,
            activeTrackColor: Colors.black,
            inactiveTrackColor: Color(0xFFCCCCCC),
          ),
        );

  SurveySliderThemeData.fromJson(Map<String, dynamic> json)
      : themeData = SliderThemeData(
          thumbColor: json['thumbColor'],
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: json['thumbRadius']),
          trackHeight: json['trackHeight'],
          activeTrackColor: Color(json['activeTrackColor']),
          inactiveTrackColor: Color(json['inactiveTrackColor']),
        );

  @override
  Map<String, dynamic> toJson() => {
        'thumbColor': themeData.trackHeight,
        'thumbRadius': (themeData.thumbShape as RoundSliderThumbShape).enabledThumbRadius,
        'trackHeight': themeData.trackHeight,
        'activeTrackColor': themeData.activeTrackColor?.value ?? 0xFF000000,
        'inactiveTrackColor': themeData.inactiveTrackColor?.value ?? 0xFF00000,
      };

  @override
  ThemeExtension<SurveySliderThemeData> copyWith({
    Color? thumbColor,
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    double? thumbRadius,
    double? trackHeight,
  }) {
    return SurveySliderThemeData(
      themeData: SliderThemeData(
        thumbColor: thumbColor ?? themeData.thumbColor,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius:
              thumbRadius ?? (themeData.thumbShape as RoundSliderThumbShape).enabledThumbRadius,
        ),
        trackHeight: trackHeight ?? themeData.trackHeight,
        activeTrackColor: activeTrackColor ?? themeData.activeTrackColor,
        inactiveTrackColor: inactiveTrackColor ?? themeData.inactiveTrackColor,
      ),
    );
  }

  @override
  ThemeExtension<SurveySliderThemeData> lerp(
    covariant ThemeExtension<SurveySliderThemeData>? other,
    double t,
  ) {
    if (other is! SurveySliderThemeData) {
      return this;
    }
    return SurveySliderThemeData(
      themeData: SliderThemeData(
        thumbColor: Color.lerp(themeData.thumbColor, other.themeData.thumbColor, t),
        activeTrackColor: Color.lerp(
          themeData.activeTrackColor,
          other.themeData.activeTrackColor,
          t,
        ),
        inactiveTrackColor: Color.lerp(
          themeData.inactiveTrackColor,
          other.themeData.inactiveTrackColor,
          t,
        ),
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: lerpDouble(
            (themeData.thumbShape as RoundSliderThumbShape).enabledThumbRadius,
            (other.themeData.thumbShape as RoundSliderThumbShape).enabledThumbRadius,
            t,
          )!,
        ),
        trackHeight: lerpDouble(themeData.trackHeight, other.themeData.trackHeight, t),
      ),
    );
  }
}
