import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:survey_sdk/src/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_sdk/src/domain/entities/survey_data.dart';
import 'package:survey_sdk/src/domain/utils/invalid_data_exception.dart';

class FilesystemDataSourceImpl implements FilesystemDataSource {
  @override
  Future<(SurveyData?, List<String>)> getSurveyData(String filePath) async {
    assert(filePath.isNotEmpty, 'asset must not be empty');

    String? json;
    try {
      if (kIsWeb) {
        final resString = kDebugMode ? filePath : 'assets/$filePath';
        json = (await http.get(Uri.parse(resString))).body;
      } else {
        json = await rootBundle.loadString(filePath);
      }

      final map = jsonDecode(json);
      return (SurveyData.fromJson(map), <String>[]);
    } catch (ex, stackTrace) {
      final invalidDataException = InvalidDataException(
        ex.toString(),
        stackTrace,
        json,
      );

      return (
        null,
        <String>[
          invalidDataException.toString(),
          invalidDataException.damagedJson(),
        ],
      );
    }
  }
}
