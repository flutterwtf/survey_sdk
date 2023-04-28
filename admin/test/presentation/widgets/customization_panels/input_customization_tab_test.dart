import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_tab.dart';
import 'package:survey_core/survey_core.dart';

import '../app_tester.dart';

void main() {
  group(
    'Input customization tab tests',
    () {
      var data = InputQuestionData.common();

      final page = AppTester(
        child: InputCustomizationTab(
          onChange: (QuestionData<dynamic> newData) {
            data = newData as InputQuestionData;
          },
          title: 'test',
          editable: data,
        ),
      );

      testWidgets(
        'widget initialized correctly',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();
          expect(find.text('test'), findsNothing);

          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Multiline'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Fill'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Border'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Padding'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Hint'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Text'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Input type'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'initial values',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();

          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Lines'),
            findsNothing,
          );
          // Multiline widget switch is off
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'FFFFFFFF'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'FF000000'),
            findsNWidgets(2),
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'FF727272'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationTextField, '1.0'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationTextField, '16.0'),
            findsNWidgets(2),
          );
          expect(data.theme?.borderWidth, 1);
          expect(data.theme?.hintSize, 16);
          expect(data.theme?.textSize, 16);

          expect(
            find.widgetWithText(DropdownCustomizationButton<InputType>, 'text'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'panel contains all the widgets',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();

          expect(find.byType(CustomizationItemsContainer), findsNWidgets(7));
          expect(find.byType(MultilineSwitch), findsOneWidget);
          expect(
            find.byType(DropdownCustomizationButton<InputType>),
            findsOneWidget,
          );
          expect(find.byType(ColorCustomizationItem), findsNWidgets(4));
          expect(find.byType(PaddingCustomizationItem), findsNWidgets(1));
          expect(find.byType(CustomizationTextField), findsNWidgets(9));
        },
      );
    },
  );
}
