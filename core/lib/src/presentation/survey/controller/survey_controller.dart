import 'package:flutter/material.dart';

class SurveyController {
  final Map<String, dynamic> _answers = {};
  final PageController _pageController = PageController();

  dynamic answer(String key) => _answers[key];

  void onNext(String pageType, dynamic data) {
    _answers['$pageType + ${_pageController.page}'] = data;
    _pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  void onBack() {
    _pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }
}

class SurveyControllerInherited extends InheritedWidget {
  final SurveyController surveyController;

  const SurveyControllerInherited({
    Key? key,
    required Widget child,
    required this.surveyController,
  }) : super(key: key, child: child);

  static SurveyControllerInherited of(BuildContext context) {
    final SurveyControllerInherited? result =
        context.dependOnInheritedWidgetOfExactType<SurveyControllerInherited>();
    assert(result != null, 'No SurveyControllerInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SurveyControllerInherited oldWidget) {
    return oldWidget.surveyController != surveyController;
  }
}
