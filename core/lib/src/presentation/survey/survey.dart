import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/presentation/di/injector.dart';
import 'package:survey_core/src/presentation/survey/survey_controller.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/src/presentation/utils/utils.dart';

class Survey extends StatefulWidget {
  final String? filePath;
  final SurveyController? controller;
  final SurveyData? surveyData;

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
    if (widget.surveyData == null) {
      _cubit.initData(widget.filePath);
    } else {
      _cubit.setSurveyData(widget.surveyData!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      bloc: _cubit,
      builder: (_, state) {
        if (state is SurveyLoadedState) {
          final data = widget.surveyData ?? state.surveyData;
          final commonTheme = data.commonTheme;
          return Theme(
            data: ThemeData(
              extensions: [
                commonTheme.choice.theme!,
                commonTheme.slider.theme!,
                commonTheme.input.theme!,
                commonTheme.intro.theme!,
              ],
            ),
            child: WillPopScope(
              onWillPop: () async {
                _surveyController.onBack();
                return false;
              },
              child: PageView(
                controller: _surveyController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: data.questions
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
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.black,
          ),
        );
      },
    );
  }
}
