import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_state.dart';

// TODO(dev): we don't need cubit probably.
class NewQuestionCubit extends Cubit<NewQuestionState> {
  NewQuestionCubit()
      : super(
          const NewQuestionState(),
        );
}
