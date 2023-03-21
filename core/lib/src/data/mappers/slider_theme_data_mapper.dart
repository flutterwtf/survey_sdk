import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';

extension SliderThemeDataMapper on SliderThemeData {
  Map<String, dynamic> toJson() => {
        'thumbColor': thumbColor?.value ?? AppColors.black,
        'thumbRadius':
            (thumbShape as RoundSliderThumbShape?)?.enabledThumbRadius ??
                AppDimensions.circularRadiusS,
        'trackHeight': trackHeight,
        'activeTrackColor': activeTrackColor?.value ?? AppColors.black,
        'inactiveTrackColor': inactiveTrackColor?.value ?? AppColors.black,
      };

  static SliderThemeData fromJson(Map<String, dynamic> json) => SliderThemeData(
        thumbColor: Color(json['thumbColor']),
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: json['thumbRadius'],
        ),
        trackHeight: json['trackHeight'],
        activeTrackColor: Color(json['activeTrackColor']),
        inactiveTrackColor: Color(json['inactiveTrackColor']),
      );
}
