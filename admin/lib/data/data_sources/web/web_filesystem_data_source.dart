import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:file_picker/file_picker.dart';
import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';
import 'package:survey_core/survey_core.dart';

class WebFileSystemDataSourceImpl implements FileSystemDataSource {
  @override
  Future<void> downloadSurveyData(Object exportJson) async {
    final mapObject = jsonEncode(exportJson);

    final bytes = utf8.encode(mapObject);
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'questions.json';
    html.document.body?.children.add(anchor);

    anchor.click();

    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
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
