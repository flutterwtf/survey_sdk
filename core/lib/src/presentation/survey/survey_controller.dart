import 'package:flutter/material.dart';

/// This controller need to navigation on survey and save answer.
/// Function [onNext] navigate to next page and save answer on last page.
/// Function [onBack] navigate to previous page.
class SurveyController {
  final Map<String, dynamic> _answers = {};
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  dynamic answer(String key) => _answers[key];

  void onNext({required String key, required dynamic data}) {
    _answers['$key + ${_pageController.page}'] = data;
    _pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  void animateTo(int index) {
    if (_pageController.hasClients && _pageController.page != null) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void onBack() {
    _pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  void dispose() {
    _pageController.dispose();
    pageController.dispose();
  }
}
