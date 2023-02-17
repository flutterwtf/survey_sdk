import 'package:flutter/material.dart';

extension SliderThemeDataMapper on SliderThemeData {
  Map<String, dynamic> toJson() => {
        'thumbColor': trackHeight,
        'thumbRadius': (thumbShape as RoundSliderThumbShape).enabledThumbRadius,
        'trackHeight': trackHeight,
        'activeTrackColor': activeTrackColor?.value ?? 0xFF000000,
        'inactiveTrackColor': inactiveTrackColor?.value ?? 0xFF00000,
      };

  static SliderThemeData fromJson(Map<String, dynamic> json) => SliderThemeData(
        thumbColor: json['thumbColor'],
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: json['thumbRadius']),
        trackHeight: json['trackHeight'],
        activeTrackColor: Color(json['activeTrackColor']),
        inactiveTrackColor: Color(json['inactiveTrackColor']),
      );
}
