import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';

class WebFileSystemDataSourceImpl implements FileSystemDataSource {
  @override
  Future<void> downloadSurveyData(Map<String, dynamic> exportJson) async {
    final json = <String, dynamic>{}..addAll(exportJson);
    final mapObject = jsonEncode(json);

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
}
