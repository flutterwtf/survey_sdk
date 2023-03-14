import 'dart:convert';

import 'package:survey_admin/data/interfaces/session_storage_data_source.dart';
import 'package:survey_core/survey_core.dart';
import 'package:universal_html/html.dart';

class SessionStorageDataSource implements ApiSessionStorageDataSource {
  static final _sessionStorage = window.sessionStorage;
  static const _surveyDataKey = 'SurveyData';

  @override
  SurveyData? getSurveyData() {
    final data = _sessionStorage[_surveyDataKey];
    if (data != null) {
      return SurveyData.fromJson(jsonDecode(data));
    } else {
      return null;
    }
  }

  @override
  void saveSurveyData(SurveyData surveyData) {
    _sessionStorage[_surveyDataKey] = jsonEncode(surveyData.toJson());
  }
}
