// Copyright (c) 2023 flutter.wtf. All rights reserved.
// Use of this source code is governed by a MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/presentation/di/injector.dart';
import 'package:survey_core/src/presentation/survey/controller/survey_controller.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';

/// The survey is responsible for the survey form in the application.
class Survey extends StatefulWidget {
  /// The [filePath] parameter is the path to a JSON file containing the survey
  /// data.
  final String? filePath;

  /// This [controller] need to navigation on survey and save answer.
  final SurveyController? controller;

  /// The [surveyData] parameter is the survey data itself.
  final SurveyData? surveyData;

  /// Only one of [filePath], [surveyData] can be not-null, and the code
  /// asserts this to be true upon initialization. Сontroller can be empty.
  const Survey({
    this.filePath,
    this.surveyData,
    this.controller,
    super.key,
  }) : assert(
          (filePath != null || surveyData != null) &&
              (filePath == null || surveyData == null),
          'Only one of the parameters must be not-null',
        );

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  late final SurveyCubit _cubit;
  late final SurveyController _surveyController;

  /// In the initState method, the code initializes an instance
  /// of [SurveyCubit] and [SurveyController] using a dependency
  /// injection pattern. It then calls the initData method of
  /// [SurveyCubit] with the survey data provided.
  @override
  void initState() {
    super.initState();
    Injector().init();
    _cubit = Injector().surveyCubit;
    _surveyController = widget.controller ?? SurveyController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cubit.initData(widget.filePath, widget.surveyData);
  }

  /// The build method renders the survey form using a PageView widget. The
  /// questions are mapped to widgets using the [DataToWidgetUtil.createWidget]
  /// method, which is passed to the BlocBuilder widget as a callback
  /// function. The BlocBuilder is responsible for managing the state of the
  /// survey and rendering the appropriate widgets based on the survey state.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      bloc: _cubit,
      builder: (BuildContext context, state) {
        if (state is SurveyLoadedState) {
          return Theme(
            data: state.surveyData.commonTheme.toThemeData(),
            child: WillPopScope(
              onWillPop: () async {
                _surveyController.onBack();
                return false;
              },
              child: PageView(
                controller: _surveyController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: state.surveyData.questions
                    .map<Widget>(
                      (question) => DataToWidgetUtil.createWidget(
                        question,
                        _cubit.saveAnswer,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        }

        /// If the survey is not yet loaded, a circular progress indicator
        /// is displayed. If the user attempts to navigate back from the
        /// first page, the onBack method of the [SurveyController] is called.
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.black,
          ),
        );
      },
    );
  }
}
