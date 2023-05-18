import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/utils/app_colors.dart';
import 'package:survey_sdk/src/presentation/utils/app_fonts.dart';

const _titleSize = 16.0;
const _subtitleSize = 12.0;
const _buttonTextSize = 12.0;
const _buttonRadius = 10.0;
const _horizontalPadding = 14.0;
const _verticalPadding = 14.0;

/// The [InputQuestionTheme] class represents the visual styling and appearance
/// for an input question options.
///
/// This class extends the [ThemeExtension] class and implements the
/// [EquatableMixin] to provide equality checks and comparison methods.
class InputQuestionTheme extends ThemeExtension<InputQuestionTheme>
    with EquatableMixin {
  /// Background color of the text field.
  /// Default value is [Colors.white]
  final Color inputFill;

  /// Color of the border around the text field.
  /// Default value is [Colors.black]
  final Color borderColor;

  /// Width of the border around the text field.
  /// Default value is [1].
  final double borderWidth;

  /// Color of the hint text that is displayed when the text field is empty.
  /// Default value is [Color(0xFF727272)].
  final Color hintColor;

  /// Font size of the hint text.
  /// Default value is [16].
  final double hintSize;

  /// Color of the text that is entered into the text field.
  /// Default value is [Colors.black].
  final Color textColor;

  /// Font size of the text that is entered into the text field.
  /// Default value is [16].
  final double textSize;

  /// Number of lines that the text field can display.
  /// Default value is [1].
  final int lines;

  /// Padding added to the top and bottom of the text field.
  /// Default value is [14.0].
  final double verticalPadding;

  /// Padding added to the left and right of the text field.
  /// Default value is [14.0].
  final double horizontalPadding;

  /// Determines if the text field supports multiple lines.
  /// Default value is [```false```].
  final bool isMultiline;

  /// Error text to be displayed when there is an input validation error.
  /// Default value is ['Error'].
  final String errorText;

  /// The type of input that the text field accepts.
  /// Default value is [InputType.text].
  final InputType inputType;

  /// Background color of the choice page.
  /// Default value is [Colors.white].
  final Color fill;

  /// Color of the title text.
  /// Default value is [Colors.black].
  final Color titleColor;

  /// Font size of the title text.
  /// Default value is [16.0].
  final double titleSize;

  /// Color of the subtitle text.
  /// Default value is [Colors.black].
  final Color subtitleColor;

  /// Font size of the subtitle text.
  /// Default value is [12.0].
  final double subtitleSize;

  /// Background color of the primary button.
  /// Default value is [Colors.black].
  final Color primaryButtonFill;

  /// Text color of the primary button.
  /// Default value is [Colors.white].
  final Color primaryButtonTextColor;

  /// Font size of the text displayed on the primary button.
  /// Default value is [12.0].
  final double primaryButtonTextSize;

  /// Border radius of the primary button.
  /// Default value is [10.0].
  final double primaryButtonRadius;

  /// Background color of the secondary button.
  /// Default value is [Colors.black].
  final Color secondaryButtonFill;

  /// Text color of the secondary button.
  /// Default value is [Colors.white].
  final Color secondaryButtonTextColor;

  /// Font size of the text displayed on the secondary button.
  /// Default value is [Colors.black].
  final double secondaryButtonTextSize;

  /// Border radius of the secondary button.
  /// Default value is [10.0].
  final double secondaryButtonRadius;

  @override
  List<Object?> get props => [
        inputFill,
        borderColor,
        borderWidth,
        inputType,
        hintColor,
        hintSize,
        textColor,
        textSize,
        errorText,
        lines,
        verticalPadding,
        horizontalPadding,
        isMultiline,
        fill,
        titleColor,
        titleSize,
        subtitleColor,
        subtitleSize,
        primaryButtonFill,
        primaryButtonTextColor,
        primaryButtonTextSize,
        primaryButtonRadius,
        secondaryButtonFill,
        secondaryButtonTextColor,
        secondaryButtonTextSize,
        secondaryButtonRadius,
      ];

  // TODO(dev): Add hint text.
  const InputQuestionTheme({
    required this.inputFill,
    required this.borderColor,
    required this.borderWidth,
    required this.hintColor,
    required this.hintSize,
    required this.textColor,
    required this.textSize,
    required this.isMultiline,
    required this.errorText,
    required this.inputType,
    required this.fill,
    required this.titleColor,
    required this.titleSize,
    required this.subtitleColor,
    required this.subtitleSize,
    required this.primaryButtonFill,
    required this.primaryButtonTextColor,
    required this.primaryButtonTextSize,
    required this.primaryButtonRadius,
    required this.secondaryButtonFill,
    required this.secondaryButtonTextColor,
    required this.secondaryButtonTextSize,
    required this.secondaryButtonRadius,
    required this.lines,
    required this.verticalPadding,
    required this.horizontalPadding,
  });

  /// Creates a common instance of [InputQuestionTheme].
  ///
  /// The [InputQuestionTheme.common] constructor is a convenience constructor
  /// that creates a common instance of [InputQuestionTheme] with predefined
  /// values.
  const InputQuestionTheme.common()
      : this(
          inputFill: Colors.white,
          borderColor: Colors.black,
          borderWidth: 1,
          lines: 1,
          hintColor: AppColors.textLightGrey,
          hintSize: AppFonts.sizeL,
          textColor: AppColors.black,
          textSize: AppFonts.sizeL,
          inputType: InputType.text,
          // TODO(dev): Replace with the text.
          errorText: 'Error',
          isMultiline: false,
          fill: Colors.white,
          titleColor: Colors.black,
          titleSize: _titleSize,
          subtitleColor: Colors.black,
          subtitleSize: _subtitleSize,
          primaryButtonFill: Colors.black,
          primaryButtonTextColor: Colors.white,
          primaryButtonTextSize: _buttonTextSize,
          primaryButtonRadius: _buttonRadius,
          secondaryButtonFill: Colors.black,
          secondaryButtonTextColor: Colors.white,
          secondaryButtonTextSize: _buttonTextSize,
          secondaryButtonRadius: _buttonRadius,
          horizontalPadding: _horizontalPadding,
          verticalPadding: _verticalPadding,
        );

  @override
  InputQuestionTheme copyWith({
    Color? inputFill,
    Color? borderColor,
    double? borderWidth,
    Color? hintColor,
    double? hintSize,
    Color? textColor,
    double? textSize,
    int? minLines,
    int? lines,
    double? verticalPadding,
    double? horizontalPadding,
    String? hintText,
    String? errorText,
    InputType? inputType,
    bool? isMultiline,
    Color? fill,
    Color? titleColor,
    double? titleSize,
    Color? subtitleColor,
    double? subtitleSize,
    Color? primaryButtonFill,
    Color? primaryButtonTextColor,
    double? primaryButtonTextSize,
    double? primaryButtonRadius,
    Color? secondaryButtonFill,
    Color? secondaryButtonTextColor,
    double? secondaryButtonTextSize,
    double? secondaryButtonRadius,
  }) {
    return InputQuestionTheme(
      inputFill: inputFill ?? this.inputFill,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      hintColor: hintColor ?? this.hintColor,
      hintSize: hintSize ?? this.hintSize,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
      lines: lines ?? this.lines,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      inputType: inputType ?? this.inputType,
      isMultiline: isMultiline ?? this.isMultiline,
      errorText: errorText ?? this.errorText,
      fill: fill ?? this.fill,
      titleColor: titleColor ?? this.titleColor,
      titleSize: titleSize ?? this.titleSize,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleSize: subtitleSize ?? this.subtitleSize,
      primaryButtonFill: primaryButtonFill ?? this.primaryButtonFill,
      primaryButtonTextColor:
          primaryButtonTextColor ?? this.primaryButtonTextColor,
      primaryButtonTextSize:
          primaryButtonTextSize ?? this.primaryButtonTextSize,
      primaryButtonRadius: primaryButtonRadius ?? this.primaryButtonRadius,
      secondaryButtonFill: secondaryButtonFill ?? this.secondaryButtonFill,
      secondaryButtonTextColor:
          secondaryButtonTextColor ?? this.secondaryButtonTextColor,
      secondaryButtonTextSize:
          secondaryButtonTextSize ?? this.secondaryButtonTextSize,
      secondaryButtonRadius:
          secondaryButtonRadius ?? this.secondaryButtonRadius,
    );
  }

  /// Linearly interpolates between two instances of [InputQuestionTheme].
  ///
  /// The [lerp] method calculates the intermediate state between two instances
  /// of [InputQuestionTheme] based on a given interpolation factor [t].
  ///
  /// If the `other` instance is not of type [InputQuestionTheme], the method
  /// returns the current instance without any interpolation.
  @override
  InputQuestionTheme lerp(
    covariant InputQuestionTheme? other,
    double t,
  ) {
    if (other is! InputQuestionTheme) {
      return this;
    }
    return InputQuestionTheme(
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      hintSize: lerpDouble(hintSize, other.hintSize, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textSize: lerpDouble(textSize, other.textSize, t)!,
      lines: lines,
      verticalPadding: lerpDouble(verticalPadding, other.verticalPadding, t)!,
      horizontalPadding:
          lerpDouble(horizontalPadding, other.horizontalPadding, t)!,
      isMultiline: isMultiline,
      inputType: inputType,
      errorText: errorText,
      fill: Color.lerp(fill, other.fill, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      titleSize: lerpDouble(titleSize, other.titleSize, t)!,
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t)!,
      subtitleSize: lerpDouble(subtitleSize, other.subtitleSize, t)!,
      primaryButtonFill: Color.lerp(
        primaryButtonFill,
        other.primaryButtonFill,
        t,
      )!,
      primaryButtonTextColor: Color.lerp(
        primaryButtonTextColor,
        other.primaryButtonTextColor,
        t,
      )!,
      primaryButtonTextSize: lerpDouble(
        primaryButtonTextSize,
        other.primaryButtonTextSize,
        t,
      )!,
      primaryButtonRadius: lerpDouble(
        primaryButtonRadius,
        other.primaryButtonRadius,
        t,
      )!,
      secondaryButtonFill: Color.lerp(
        secondaryButtonFill,
        other.secondaryButtonFill,
        t,
      )!,
      secondaryButtonTextColor: Color.lerp(
        secondaryButtonTextColor,
        other.secondaryButtonTextColor,
        t,
      )!,
      secondaryButtonTextSize: lerpDouble(
        secondaryButtonTextSize,
        other.secondaryButtonTextSize,
        t,
      )!,
      secondaryButtonRadius: lerpDouble(
        secondaryButtonRadius,
        other.secondaryButtonRadius,
        t,
      )!,
    );
  }
}

/// The [InputType] represents different types of input fields that can be used
/// in the input question component.
/// It is used in conjunction with the [InputQuestionTheme] class to define the
/// type of input field and validate the user input accordingly.
enum InputType {
  /// Represents a text input field where the user can enter alphanumeric
  /// characters.
  text,

  /// Represents a numeric input field where the user can enter numeric values.
  number,

  /// Represents a date input field where the user can select a date from a
  /// date picker.
  date,

  /// Represents an email input field where the user can enter a valid email
  /// address.
  email,

  /// Represents a password input field where the user can enter a secure
  /// password.
  password,

  /// Represents a phone number input field where the user can enter a valid
  /// phone number.
  phone;

  /// Returns the string representation of the enum value.
  String toJson() => name;

  /// Converts a string representation (in JSON format) of an [InputType]
  /// value back into its corresponding enum value.
  static InputType fromJson(String json) => values.byName(json);
}
