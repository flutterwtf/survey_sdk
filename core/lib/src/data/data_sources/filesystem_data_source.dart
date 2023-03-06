import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:survey_core/src/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';

class FilesystemDataSourceImpl implements FilesystemDataSource {
  @override
  Future<SurveyData> getSurveyData(String asset) async {
    assert(asset.isNotEmpty, 'asset must not be empty');

    String json;
    if (kIsWeb) {
      final resString = kDebugMode ? asset : 'assets/$asset';
      json = (await http.get(Uri.parse(resString))).body;
    } else {
      json = await rootBundle.loadString(asset);
    }
    return getSurveyDataFromJson(json);
  }

  @override
  SurveyData getSurveyDataFromJson(String json) {
    final map = jsonDecode(json);
    return SurveyData.fromJson(map);
  }
}
