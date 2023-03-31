# Survey Core

Survey Core is a survey module designed to facilitate the creation of surveys and questionnaires in
Flutter applications. It includes the main logic for generating and displaying questions, as well as
customizable question pages.

## Question Types

The Survey Core package supports next types of questions:

- Choice questions

- Input questions

- Introduction questions

- Slider questions

## Usage

```dart
Survey(
surveyData: SurveyData(
questions: [
const ChoiceQuestionData(
isMultipleChoice: true,
options: ['option 1', 'option 2', 'option 3'],
index: 0,
title: 'title',
subtitle: 'subtitle',
isSkip: true,
),
],
commonTheme: CommonTheme(
textFieldThemeData: const TextFieldThemeData.common(),
sliderThemeData: const SliderThemeData(),
),
),
controller: SurveyController(),
)
```