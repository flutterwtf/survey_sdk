import 'dart:convert';
// TODO(dev): does it work in web app?
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';

// TODO(dev): rename
class SurveyDataRepositoryImpl implements FileSystemDataSource {
  Future<String> get _localPath async {
    // TODO(dev): it's kinda strange to use
    //  getters instead of methods for futures.
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get _getFilePath async {
    final path = await _localPath;
    return File('$path/survey.json');
  }

  @override
  Future<void> downloadSurveyData(Map<String, dynamic> exportJson) async {
    final filePath = await _getFilePath;
    final json = <String, dynamic>{}..addAll(exportJson);
    final mapObject = jsonEncode(json);
    filePath.writeAsString(mapObject);
  }
}
