import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';

class BuilderCubit extends Cubit<BuilderState> {
  BuilderCubit() : super(
    const BuilderState(),
  );
}