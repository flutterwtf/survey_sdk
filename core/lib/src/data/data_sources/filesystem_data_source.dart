import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:survey_core/src/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:http/http.dart' as http;

class FilesystemDataSourceImpl implements FilesystemDataSource {
  @override
  Future<SurveyData> getSurveyData(String asset) async {
    String json;
    if (kIsWeb) {
      final resString = kDebugMode ? asset : 'assets/$asset';
      json = (await http.get(Uri.parse(resString))).body;
    } else {
      json = await rootBundle.loadString(asset);
    }
    var map = jsonDecode(json);
    return SurveyData.fromJson(map);
  }

}