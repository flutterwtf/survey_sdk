import 'package:survey_sdk/presentation/base/base_cubit.dart';
import 'package:survey_sdk/presentation/pages/new_question_page/new_question_state.dart';

class NewQuestionCubit extends BaseCubit<NewQuestionState> {
  NewQuestionCubit()
      : super(
          const NewQuestionState(),
        );
}
