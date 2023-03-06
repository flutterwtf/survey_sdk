import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_core/src/domain/entities/api_object.dart';

class ChoiceQuestionTheme extends ThemeExtension<ChoiceQuestionTheme>
    with ApiObject, EquatableMixin {
  final Color activeColor;
  final Color inactiveColor;

  const ChoiceQuestionTheme({
    required this.activeColor,
    required this.inactiveColor,
  });

  const ChoiceQuestionTheme.common()
      : this(
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
        );

  ChoiceQuestionTheme.fromJson(Map<String, dynamic> json)
      : activeColor = Color(json['activeColor']),
        inactiveColor = Color(json['inactiveColor']);

  @override
  ThemeExtension<ChoiceQuestionTheme> copyWith({
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return ChoiceQuestionTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
    );
  }

  @override
  ThemeExtension<ChoiceQuestionTheme> lerp(
    covariant ThemeExtension<ChoiceQuestionTheme>? other,
    double t,
  ) {
    if (other is! ChoiceQuestionTheme) {
      return this;
    }
    return ChoiceQuestionTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'activeColor': activeColor.value,
        'inactiveColor': inactiveColor.value,
      };

  List<Object?> get props => [
        activeColor,
        inactiveColor,
      ];
}
