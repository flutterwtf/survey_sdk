import 'package:survey_admin/data/interfaces/local_storage_data_source.dart';
import 'package:survey_admin/domain/repository_interfaces/local_storage_data_repository.dart';
import 'package:survey_core/survey_core.dart';

class LocalStorageDataRepositoryImpl implements LocalStorageDataRepository {
  final LocalStorageDataSource _localStorageDataSource;

  LocalStorageDataRepositoryImpl(this._localStorageDataSource);

  @override
  Future<SurveyData?> surveyData() async {
    return _localStorageDataSource.surveyData();
  }
}
