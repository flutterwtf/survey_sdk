import 'package:flutter/material.dart';

extension SliderThemeDataMapper on SliderThemeData {
  Map<String, dynamic> toJson() => {
        'thumbColor': thumbColor?.value ?? 0xFF000000,
        'thumbRadius':
            (thumbShape as RoundSliderThumbShape?)?.enabledThumbRadius ?? 10,
        'trackHeight': trackHeight,
        'activeTrackColor': activeTrackColor?.value ?? 0xFF000000,
        'inactiveTrackColor': inactiveTrackColor?.value ?? 0xFF00000,
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
