import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_cubit.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_state.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_tabs.dart';

import '../../../utils/mocked_entities.dart';

void main() {
  group('New Question Cubit', () {
    final data = MockedEntities.data1;

    blocTest<NewQuestionCubit, NewQuestionState>(
      'emits updated Tab',
      build: () => NewQuestionCubit(data),
      act: (cubit) => cubit.selectTab(NewQuestionTabs.slider),
      expect: () => <NewQuestionState>[
        NewQuestionState(
          selectedTab: NewQuestionTabs.slider,
          data: data,
        ),
      ],
    );

    blocTest<NewQuestionCubit, NewQuestionState>(
      'emits updated CommonTheme for choice question',
      build: () => NewQuestionCubit(data),
      act: (cubit) => cubit.updateData(MockedEntities.choice2),
      expect: () => <NewQuestionState>[
        NewQuestionState(
          data: data.copyWith(
            commonTheme: data.commonTheme
                .copyWith(choice: MockedEntities.choice2),
          ),
        ),
      ],
    );

    blocTest<NewQuestionCubit, NewQuestionState>(
      'emits updated CommonTheme for info question',
      build: () => NewQuestionCubit(data),
      act: (cubit) => cubit.updateData(MockedEntities.info2),
      expect: () => <NewQuestionState>[
        NewQuestionState(
          data: data.copyWith(
            commonTheme: data.commonTheme
                .copyWith(info: MockedEntities.info2),
          ),
        ),
      ],
    );

    blocTest<NewQuestionCubit, NewQuestionState>(
      'emits updated CommonTheme for slider question',
      build: () => NewQuestionCubit(data),
      act: (cubit) => cubit.updateData(MockedEntities.slider2),
      expect: () => <NewQuestionState>[
        NewQuestionState(
          data: data.copyWith(
            commonTheme: data.commonTheme
                .copyWith(slider: MockedEntities.slider2),
          ),
        ),
      ],
    );

    blocTest<NewQuestionCubit, NewQuestionState>(
      'emits updated CommonTheme for input question',
      build: () => NewQuestionCubit(data),
      act: (cubit) => cubit.updateData(MockedEntities.input2),
      expect: () => <NewQuestionState>[
        NewQuestionState(
          data: data.copyWith(
            commonTheme: data.commonTheme
                .copyWith(input: MockedEntities.input2),
          ),
        ),
      ],
    );
  });
}
