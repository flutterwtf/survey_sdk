import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_panel.dart';
import 'package:survey_core/survey_core.dart';

import '../app_tester.dart';

void main() {
  var data = const SliderQuestionData.common();

  final page = AppTester(
    child: SliderCustomizationPanel(
      onChange: (QuestionData<dynamic> newData) {
        data = newData as SliderQuestionData;
      },
      editable: data,
    ),
  );

  group('SliderCustomizationPanel test', () {
    testWidgets('TabBar contains required tabs', (tester) async {
      await tester.pumpWidget(page);

      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Slider'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets(
      'Switch to Common panel and check content',
      (tester) async {
        await tester.pumpWidget(page);

        // switch to Common panel
        await tester.tap(find.text('Common'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Fill'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Title'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Primary button'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Switch to Slider panel and check content',
      (tester) async {
        await tester.pumpWidget(page);

        // switch to Slider panel
        await tester.tap(find.text('Slider'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Thickness'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Active'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Inactive'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Thumb'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Switch to Content panel and check content',
      (tester) async {
        await tester.pumpWidget(page);

        // switch to Content panel
        await tester.tap(find.text('Content'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Title'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Value'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Divisions'),
          findsOneWidget,
        );
      },
    );
  });
}
