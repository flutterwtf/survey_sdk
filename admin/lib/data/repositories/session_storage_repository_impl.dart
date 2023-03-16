import 'package:survey_admin/data/interfaces/session_storage_data_source.dart';
import 'package:survey_admin/domain/repository_interfaces/session_storage_repository.dart';
import 'package:survey_core/survey_core.dart';

class SessionStorageRepositoryImpl implements SessionStorageRepository {
  final SessionStorageDataSource _sessionStorageDataSource;

  const SessionStorageRepositoryImpl(this._sessionStorageDataSource);

  @override
  SurveyData? getSurveyData() => _sessionStorageDataSource.getSurveyData();

  @override
  void saveSurveyData(SurveyData surveyData) =>
      _sessionStorageDataSource.saveSurveyData(surveyData);
}
