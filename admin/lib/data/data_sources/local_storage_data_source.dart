import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:survey_admin/data/interfaces/local_storage_data_source.dart';
import 'package:survey_core/survey_core.dart';

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  @override
  Future<SurveyData?> surveyData() async {
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
