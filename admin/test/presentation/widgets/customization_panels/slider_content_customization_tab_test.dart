import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_content_customization_tab.dart';
import 'package:survey_core/survey_core.dart';

import '../app_tester.dart';

void main() {
  group('Tests for SliderContentCustomizationTab', () {
    const title = '';
    const subtitle = '';

    var data = const SliderQuestionData.common();
    final page = AppTester(
      child: SliderContentCustomizationTab(
        title: 'Content',
        onChange: (QuestionData<dynamic> newData) {
          data = newData as SliderQuestionData;
        },
        editable: data,
      ),
    );

    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(page);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.text('Value'), findsOneWidget);
      expect(find.text('Divisions'), findsOneWidget);
    });

    testWidgets('Input text for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Title'),
        'title',
      );
      expect(find.text('title'), findsOneWidget);
      expect(title, 'title');
    });

    testWidgets('Input text for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
        'sub',
      );
      expect(find.text('sub'), findsOneWidget);
      expect(subtitle, 'sub');
    });

    testWidgets('Input num for Divisions', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Divisions'),
        '1',
      );
      expect(find.text('1'), findsOneWidget);
      expect(data.divisions, 1);
    });

    testWidgets('Input text for Divisions', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Divisions'),
        'q',
      );
      final divisionsBeforeEnter = data.divisions;
      expect(find.text('q'), findsNothing);
      expect(data.divisions, divisionsBeforeEnter);
    });

    testWidgets('Validate length > 3 input for Divisions', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Divisions'),
        '1234',
      );
      expect(find.text('1234'), findsNothing);
      expect(data.divisions, 123);
    });

    testWidgets('Input min,max for Value(num)', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).first, '5');
      expect(find.text('5'), findsOneWidget);
      expect(data.minValue, 5);

      await tester.enterText(find.byType(CustomizationTextField).at(1), '15');
      expect(find.text('15'), findsOneWidget);
      expect(data.maxValue, 15);
    });

    testWidgets('Input min,max for Value(string)', (tester) async {
      await tester.pumpWidget(page);

      final minBeforeEnter = data.minValue;
      await tester.enterText(find.byType(CustomizationTextField).first, 'qw');
      expect(find.text('qw'), findsNothing);
      expect(data.minValue, minBeforeEnter);

      await tester.enterText(find.byType(CustomizationTextField).at(1), 'qw');
      final maxBeforeEnter = data.maxValue;
      expect(find.text('qw'), findsNothing);
      expect(data.maxValue, maxBeforeEnter);
    });

    testWidgets('Validate length > 6 input min,max for Value', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.byType(CustomizationTextField).at(1),
        '9876543',
      );
      expect(find.text('987654'), findsOneWidget);
      expect(data.maxValue, 987654);

      await tester.enterText(
        find.byType(CustomizationTextField).first,
        '2345678',
      );
      expect(find.text('234567'), findsOneWidget);
      expect(data.minValue, 234567);
    });

    testWidgets('Validate min>max for Value', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(1), '100');
      expect(data.maxValue, 100);

      await tester.enterText(find.byType(CustomizationTextField).first, '101');
      expect(data.minValue, 0);

      await tester.enterText(find.byType(CustomizationTextField).first, '505');
      expect(data.minValue, 0);

      await tester.enterText(find.byType(CustomizationTextField).first, '99');
      expect(data.minValue, 99);
    });
  });
}
