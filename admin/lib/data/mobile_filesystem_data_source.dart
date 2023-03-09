import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';

//TODO: implement mobile data source
class MobileFileSystemDataSourceImpl implements FileSystemDataSource {
  @override
  Future<void> downloadSurveyData(Map<String, dynamic> exportJson) async {
    throw UnimplementedError();
  }
}
