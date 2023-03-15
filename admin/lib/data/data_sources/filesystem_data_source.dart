import 'dart:convert';
import 'dart:html';
import 'package:survey_admin/data/data_sources/interfaces/filesystem_data_source.dart';

class FilesystemDataSourceImpl implements FilesystemDataSource {
  @override
  Future<void> downloadSurveyData(Map<String, dynamic> exportJson) async {
    assert(exportJson.isNotEmpty, 'asset must not be empty');
    final json = <String, dynamic>{}..addAll(exportJson);
    final mapObject = jsonEncode(json);
    final jsonBlob = Blob([mapObject], 'survey.json', 'native');
    AnchorElement(href: Url.createObjectUrlFromBlob(jsonBlob))
      ..download = 'survey.json'
      ..click();
  }
}
