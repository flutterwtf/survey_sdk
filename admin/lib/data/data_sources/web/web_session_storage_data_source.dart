import 'dart:convert';
import 'dart:html'; //ignore: avoid_web_libraries_in_flutter

import 'package:survey_admin/data/data_sources/interfaces/session_storage_data_source.dart';
import 'package:survey_core/survey_core.dart';

class WebSessionStorageDataSource implements SessionStorageDataSource {
  static final _sessionStorage = window.sessionStorage;
  static const _surveyDataKey = 'SurveyData';

  @override
  SurveyData? getSurveyData() {
    final data = _sessionStorage[_surveyDataKey];
    if (data != null) {
      return SurveyData.fromJson(jsonDecode(data));
    }
    return null;
  }

  @override
  void saveSurveyData(SurveyData surveyData) {
    _sessionStorage[_surveyDataKey] = jsonEncode(surveyData.toJson());
  }
}
