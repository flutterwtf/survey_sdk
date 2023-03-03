import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';

class SurveyDataRepositoryImpl implements FileSystemDataSource {
  Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get _getFilePath async {
    final path = await _localPath;
    return File('$path/survey.json');
  }

  @override
  void downloadSurveyData(Map<String, dynamic> exportJson) async {
    final filePath = await _getFilePath;
    Map<String, dynamic> json = {};
    json.addAll(exportJson);
    var mapObject = jsonEncode(json);
    filePath.writeAsString(mapObject);
  }
}
