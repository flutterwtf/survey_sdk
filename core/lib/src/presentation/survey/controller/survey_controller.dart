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
