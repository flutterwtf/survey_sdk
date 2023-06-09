# Survey Admin Module

The Admin module is a web application that allows you to build, manage and customize surveys. It provides a user-friendly interface to modify and customize survey widgets, as well as import and export survey modifications. This module provides a user-friendly interface for creating and configuring surveys, and it is designed to work seamlessly with the  [Survey SDK](https://github.com/What-the-Flutter/survey_sdk "inspect Survey SDK").

## Features

- Survey Creation: Build custom surveys allowing you to add various question types, such as input field with different input types and validation, multiple-choice, slider, and more.
- Question editing: Configure questions' settings, including title, subtitle, and other customization options.
- Question Management: Add, edit, and delete questions within a survey, reorder them.
- Preview: Preview your survey to see how it will appear to respondents before integrating.
- Import and Export: Import and export surveys as JSON files for easy backup purposes and sharing them with others.

# Usage

## Get started

Upon the first launch of the application, you will find that there are already some initial questions available for you to manage. They are provided as examples to help you get started quickly.

![initial_questions](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/bf8abee3-1a18-4352-b0bd-fd462c824127)

You can explore these questions, view their structure, and modify them according to your needs.

## Question Creation

Upon creating a new question, you will be presented with a preview of how the question will appear. This preview allows you to visualize the question and its associated widget configuration in real-time, helping you make informed decisions about its customization.

In addition to the preview, the application offers a set of basic settings that you can adjust to tailor the question to your specific requirements. By modifying these settings, you can fine-tune the question and its widget configuration to match your desired survey design and functionality.

![creating_a_new_question](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/fcbe6ab8-58db-449e-bc30-35f168e31977)

## Question editing

You have the flexibility to customize various aspects of each question in your surveys. The application offers a wide range of configuration options, enabling you to tailor each question to your specific requirements and create highly customized surveys. 

In addition to the extensive customization options for each question, the Admin Flutter Project with Core Survey SDK provides a set of common settings that might be applied to every question. These common settings allow you to configure certain aspects that can be nessesary across different questions in your surveys. They are splitted up into two tabs: ***Common*** and ***Content***.

***Common*** contains:

- ```Fill:``` background color of screen
- ```Title:``` color and font size of Title
- ```Subtitle:``` color and font size of Subtitle
- ```Primary button:``` color of Primary button background, color of Primary button's text, font size of text, Primary button's border radius
- ```Secondary button:``` color of Secondary button background, color of Secondary button's text, font size of text, Secondary button's border radius (This is shown if the Secondary button is enabled)

***Content*** contains:

- ```Title:``` text for Title
- ```Subtitle:``` text for Subtitle
- ```Primary button:``` text for Primary button
- ```Secoondary button:``` toggle to enable or disable Secondary button, text for Secondary button

***

### Infos

![info_common](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/74f41791-2e8f-4919-89f5-5df952353d9b)

![info_content](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/12ccf3ec-e59d-4af1-be25-f8e2c4646a22)


This question contains only basic settings.

***

### Choice

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/aba0b7cf-05e5-46d9-b7ef-8ffab33be9cc)

In addition to ***Common*** and ***Content*** tabs, there is also ***Radio buttons*** tab (or ***Check boxes*** depending on settings)

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/3f90bb1a-6beb-4358-acd7-662909df23e1)

This tab contains:

- ```Multiple choice:``` toggle to enable or disable multiple choice
- ```Active:``` backgroud color of options' buttons if they are active
- ```Inactive:``` background color of options' buttons if they are inactive

In addition to basic settings in ***Content*** tab there is an extra one.

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/d2a63ea8-1d2b-4d59-aa40-92a7433abe34)

- ```Options:``` all options of Choice question, there you can add, edit and delete these options

***

### Slider

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/db3e8b0a-d84a-4300-b220-c324fe158687)

In addition to ***Common*** and ***Content*** tabs, there is also ***Slider*** tab

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/ba7f8756-ef56-45e6-9ac4-a2bfc3afcf5e)

This tab contains:

- ```Thickness:``` thickness of Slider's track
- ```Active:``` color of active part of Slider's track
- ```Inactive:``` color of inactive part of Slider's track
- ```Thumb:``` color and radius of Slider's thumb

In addition to basic settings in ***Content*** tab there is an extra ones.

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/dc07024d-2848-4ebd-8541-f6e047047511)

- ```Value:``` minimum and maximum values of Slider
- ```Divisions:``` number of divisions for Slider

***

### Input

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/319eabca-0017-4176-92a1-39696757f0e6)

In addition to ***Common*** and ***Content*** tabs, there is also ***Input*** tab

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/b5c6d4ea-7805-4925-961a-7a7146c5edfe)

This tab contains:

- ```Multiline:``` toggle to enable or disable multiline text in input
- ```Fill:``` backgroud color of Input's field
- ```Border:``` color and width of Input's border
- ```Padding:``` horizontal and vertical padding for content in Input field
- ```Hint:``` color and fontsize of hint in Input field
- ```Text:``` color and fontsize of text in Input field
- ```Input type:``` text type for validation [text, number, date, email, password, phone]
- ```Validation error message:``` error text if validation fails

In addition to basic settings in ***Content*** tab there is an extra one.

![image](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/f2e3d70e-506a-42b8-81ed-7cb753136114)

- ```Hint:``` hint text in Input field

***

## Question Management

Edit existing questions, delete them, or reorder them within a survey.

![video_2023-05-17_03-14-47](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/a51a6fdd-b103-4fe9-9551-2661a202a716)

## Preview

Before integrating your survey, use the preview feature to see how the survey will appear to respondents. Make any necessary adjustments to ensure a smooth user experience.

## Import and Export

To further enhance flexibility and collaboration, the project supports importing and exporting modifications. This allows to import modifications from external sources and makes it easy to share and reuse customization settings. On the other hand, you can also export modifications as a JSON file for backup purposes or to share them with other.

![video_2023-05-17_03-08-47](https://github.com/What-the-Flutter/survey_sdk/assets/94079414/012e77ce-3605-484b-afd1-d874048ae67d)
