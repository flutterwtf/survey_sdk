import 'dart:convert';

// TODO(dev): does it work in web app?
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';
import 'package:survey_core/survey_core.dart';

class FileSystemDataSourceImpl implements FileSystemDataSource {
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

  @override
  Future<SurveyData?> importSurveyData() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final bytes = result.files.single.bytes;
      if (bytes != null) {
        final string = const Utf8Decoder().convert(bytes);
        final map = json.decode(string);
        return SurveyData.fromJson(map);
      }
    }
    return null;
  }
}
