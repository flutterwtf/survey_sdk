import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/presentation/di/injector.dart';
import 'package:survey_core/src/presentation/survey/controller/survey_controller.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';

class Survey extends StatefulWidget {
  final String surveyDataAsset;
  final SurveyController? surveyController;

  Survey({
    required this.surveyDataAsset,
    this.surveyController,
    super.key,
  }) {
    Injector().init();
  }

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final _cubit = Injector().surveyCubit;
  late final SurveyController _surveyController;

  @override
  void initState() {
    super.initState();
    _surveyController = widget.surveyController ?? SurveyController();
    _cubit.initData(widget.surveyDataAsset);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      bloc: _cubit,
      builder: (BuildContext context, state) {
        final surveyData = state.surveyData;
        return surveyData == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.black,
                ),
              )
            : Theme(
                data: surveyData.commonTheme.toThemeData().copyWith(
                      textTheme: const TextTheme(
                        titleMedium: TextStyle(
                          color: AppColors.black,
                          fontWeight: AppFonts.weightBold,
                          fontFamily: AppFonts.karla,
                        ),
                        titleSmall: TextStyle(
                          color: AppColors.black,
                          fontWeight: AppFonts.weightRegular,
                          fontFamily: AppFonts.karla,
                          fontSize: AppFonts.sizeS,
                        ),
                        labelLarge: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppFonts.karla,
                          fontWeight: AppFonts.weightBold,
                        ),
                        bodyMedium: TextStyle(
                          color: AppColors.black,
                          fontFamily: AppFonts.karla,
                          fontWeight: AppFonts.weightRegular,
                        ),
                        bodySmall: TextStyle(
                          color: AppColors.black,
                          fontWeight: AppFonts.weightRegular,
                          fontFamily: AppFonts.karla,
                        ),
                      ),
                    ),
                child: WillPopScope(
                  onWillPop: () async {
                    _surveyController.onBack();
                    return false;
                  },
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: surveyData.questions
                        .map<Widget>(
                          (question) => DataToWidgetUtil.createWidget(
                            question,
                            _cubit.saveAnswer(question),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
      },
    );
  }
}
