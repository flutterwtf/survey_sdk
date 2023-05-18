import 'package:flutter/material.dart';

/// This controller need to navigation on survey and save answer.
/// Function [onNext] navigate to next page and save answer on last page.
/// Function [onBack] navigate to previous page.
class SurveyController {
  /// A map to store the answers provided during the survey.
  final Map<String, dynamic> _answers = {};

  /// The controller responsible for managing the pages in the survey.
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

  /// Animates the [_pageController] to navigate to the specified [index].
  /// This method smoothly transitions to the desired page.
  void animateTo(int index) {
    if (_pageController.hasClients && _pageController.page != null) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    }
  }

  /// Moves the [_pageController] to the previous page, effectively allowing the
  /// user to navigate back within the survey.
  void onBack() {
    _pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  void dispose() {
    _pageController.dispose();
  }
}
