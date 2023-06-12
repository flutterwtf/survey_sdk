# Survey SDK

The Survey SDK is a toolkit that allows developers to integrate surveys and feedback mechanisms into their Flutter applications quickly and easily.

## Getting Started ❗

To get started with using the Survey SDK, simply follow these steps:

1. Clone the GitHub repository into your local environment.

2. Install the required dependencies by running the following command:

        flutter pub get

3. Import the Survey SDK into your Flutter application by including it in your pubspec.yaml file:

        dependencies:
          survey_sdk: ^0.0.1

4. Start using the Survey SDK in your Flutter application.

## Features 💡
The Survey SDK offers a range of customizable widgets and components that can be used to integrate surveys and feedback mechanisms into your Flutter application with ease. Some of the key features include:

- ⚙️ Customizable survey forms with a range of different question types.

- 🖥️ A variety of feedback mechanisms, including in-app feedback forms, email feedback forms, and more.

- 🧿 Integration with popular analytics platforms such as Google Analytics and Firebase Analytics.

- 🌐 Support for internationalization/localization, allowing you to support multiple languages and locales.

- 🖨️ You can also export or import the created survey to a json file in the admin package.

- 🖌️ Survey theme customization (background color, font styles, button colors, etc.).

## Survey

A widget that renders a survey form. It manages the state of the survey and renders the appropriate widgets based on the survey state.

The survey form is defined by either a `filePath` parameter or a `surveyData` parameter. The `filePath` is the path to a JSON file containing the survey data, while the `surveyData` parameter is the survey data itself.

Either `filePath` or `surveyData` must pe provided. Also there is a `controller` parameter that is optional and can be used to provide a custom survey controller.

# Example of usage

```dart
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey example'),
      ),
      // Add Survey to your widget tree with filePath parameter that accepts
      // a json file with parsed survey data
      body: const Survey(filePath: 'assets/questions.json'),
    );
  }
```

You can see a full example [here](example/).

## SurveyData

Holds the core survey data used in the whole app, including the list of questions and the common theme.

Besides that, there is method `toJson` and factory `.fromJson` to import and export this Survey data.
***

## Questions

### Types: *Choice*, *Input*, *Info*, *Slider*.

***
## QuestionData class
An abstract class that serves as the foundation for creating various types of question data classes. It provides common properties and methods that are shared among different question types.  
They are:
* `index`
* `title`
* `subtitle`
* `content`
* `isSkip`
* `primaryButtonText`
* `secondaryButtonText`
* `type`

*Note: to create subclasses from `QuestionData` must provide an implementation for the `type` property.*

Besides, this class contains such methods as: `copyWith` and static method `fromType`.

## Question's data types
Classes that extend the [QuestionData class](README.md#questiondata-class) and provides additional properties and methods specific to choice questions.

Also they contain named constructor `.common` which initializes class with default values.

***
## ChoiceQuestionData
Data class representing a question with multiple or single choice.

### Unique fields:
* `isMultipleChoice` Default value is *false*.
* `options` Default value is *\['First option', 'Second option', 'Third option']*.
* `selectedOptions` Default value is *null*.
* `ruleType` Default value is *RuleType.none*.
* `ruleValue` Default value is *0*.
  * `theme` Default value is *[ChoiceQuestionTheme](README.md#choicequestiontheme).common()*.

***
## InputQuestionData
Data class representing an input question.

### Unique fields:
* `validator` Default value is *InputValidator.number()*.
* `hintText` Default value is *null*.
* `theme` Default value is *[InputQuestionTheme](README.md#inputquestiontheme).common()*.

***
## InfoQuestionData
Data class representing an information question.

### Unique field:
* `theme` Default value is *[InfoQuestionTheme](README.md#infoquestiontheme).common()*.

***
## SliderQuestionData
Data class representing data for a question that uses a slider to select a value within minimum and maximum range.

### Unique fields:
* `minValue` Default value is *0*.
* `maxValue` Default value is *10*.
* `initialValue` Default value is *5*.
* `divisions` Default value is *8*.
* `theme` Default value is *[SliderQuestionTheme](README.md#sliderquestiontheme).common()*.

***
## Common Theme
A theme class that extends the `ThemeExtension` and includes common properties for various question types. It represents the visual styling and configuration for displaying questions in a consistent manner.

Contains:
* [`choice`](README.md#choicequestiondata)
* [`input`](README.md#inputquestiondata)
* [`info`](README.md#infoquestiondata)
* [`slider`](README.md#sliderquestiondata)

## Subclasses
These classes extend the `ThemeExtension` class and implements the `EquatableMixin` to provide equality checks and comparison methods.

Each class has named constructor `.common` that is a convenience constructor which creates a common instance of class with default values.

Besides, each class contains such fields as:
* `fill` Default value is *Colors.white*.
* `titleColor` Default value is *Colors.black*.
* `titleSize` Default value is *16.0*.
* `subtitleColor` Default value is *Colors.black*.
* `subtitleSize` Default value is *12.0*.
* `primaryButtonFill` Default value is *Colors.black*.
* `primaryButtonTextColor` Default value is *Colors.white*.
* `primaryButtonTextSize` Default value is *12.0*.
* `primaryButtonRadius` Default value is *10.0*.
* `secondaryButtonFill` Default value is *Colors.black*.
* `secondaryButtonTextColor` Default value is *Colors.white*.
* `secondaryButtonTextSize` Default value is *12.0*.
* `secondaryButtonRadius` Default value is *10.0*.

***
## ChoiceQuestionTheme
Represents the visual styling and appearance of options in a choice question.

Unique fields:
* `activeColor` Default value is *Colors.black*.
* `inactiveColor` Default value is *Colors.grey*.

***
## InputQuestionTheme
Represents the visual styling and appearance for an input question options.

Unique fields:
* `inputFill` Default value is *Colors.white*.
* `borderColor` Default value is *Colors.black*.
* `borderWidth` Default value is *1.0*.
* `hintColor` Default value is *Color(0xFF727272)*.
* `hintSize` Default value is *16.0*.
* `textColor` Default value is *Colors.black*.
* `textSize` Default value is *16.0*.
* `lines` Default value is *1*.
* `verticalPadding` Default value is *14.0*.
* `horizontalPadding` Default value is *14.0*.
* `isMultiline` Default value is *false*.
* `errorText` Default value is *'Error'*.
* `inputType` Default value is *InputType.text*.

***
## InfoQuestionTheme
Represents the visual styling and appearance for an info question options.

This class doesn't contains any unique fields.

*** 
## SliderQuestionTheme
Represents the visual styling and appearance for an slider question options.

Unique fields:
* `activeColor` Default value is *Colors.black*.
* `inactiveColor` Default value is *Color(0xFFCCCCCC)*.
* `thumbColor` Default value is *Colors.black*.
* `thumbRadius` Default value is *16.0*.

***
## Presentation

### Choice question

![choice_question_page](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/6a0e08c0-146d-4358-ae04-4e736687ea4b)

***
### Input question

![input_question_page](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/e0cd9e59-f996-45d0-adb8-516a8f86a0f8)

***
### Info question

![info_question_page](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/9820aced-1bad-49bd-8d0b-8b4acab8d90c)

***
### Slider question

![slider_question_page](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/ddb6660b-96af-4847-a743-798693fea229)

***
For detailed information on how to use the Survey SDK, refer to the documentation included in the package.
