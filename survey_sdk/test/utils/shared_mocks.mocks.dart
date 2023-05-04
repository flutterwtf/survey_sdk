// Mocks generated by Mockito 5.4.0 from annotations
// in survey_core/test/utils/shared_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:survey_sdk/src/data/data_sources/interfaces/filesystem_data_source.dart'
    as _i3;
import 'package:survey_sdk/src/data/repositories/survey_data_repository_impl.dart'
    as _i5;
import 'package:survey_sdk/src/domain/entities/survey_data.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSurveyData_0 extends _i1.SmartFake implements _i2.SurveyData {
  _FakeSurveyData_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FilesystemDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilesystemDataSource extends _i1.Mock
    implements _i3.FilesystemDataSource {
  MockFilesystemDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.SurveyData> getSurveyData(String? filePath) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSurveyData,
          [filePath],
        ),
        returnValue: _i4.Future<_i2.SurveyData>.value(_FakeSurveyData_0(
          this,
          Invocation.method(
            #getSurveyData,
            [filePath],
          ),
        )),
      ) as _i4.Future<_i2.SurveyData>);
}

/// A class which mocks [SurveyDataRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockSurveyDataRepositoryImpl extends _i1.Mock
    implements _i5.SurveyDataRepositoryImpl {
  MockSurveyDataRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.SurveyData> getSurveyData(String? filePath) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSurveyData,
          [filePath],
        ),
        returnValue: _i4.Future<_i2.SurveyData>.value(_FakeSurveyData_0(
          this,
          Invocation.method(
            #getSurveyData,
            [filePath],
          ),
        )),
      ) as _i4.Future<_i2.SurveyData>);
}