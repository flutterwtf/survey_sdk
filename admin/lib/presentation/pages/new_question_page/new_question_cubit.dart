import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_state.dart';

class NewQuestionCubit extends Cubit<NewQuestionState> {
  NewQuestionCubit()
      : super(
          const NewQuestionState(),
        );
}
