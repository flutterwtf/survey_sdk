import 'package:freezed_annotation/freezed_annotation.dart';

part 'builder_state.freezed.dart';

@freezed
class BuilderState with _$BuilderState {
  const factory BuilderState({
    @Default('') String field1,
  }) = _BuilderState;
}