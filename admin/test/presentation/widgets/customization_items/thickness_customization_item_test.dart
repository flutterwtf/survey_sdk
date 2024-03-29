import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/thickness_customization_item.dart';

import '../app_tester.dart';

// TODO(dev): rebuild this test
void main() {
  group(
    'Tests for ThicknessCustomizationItem',
    () {
      const initialSize = 16.0;
      const text = 'px';
      const inputNum = '10.0';
      const inputText = 'qwe';
      const inputValidation = '100';
      final page = AppTester(
        child: ThicknessCustomizationItem(
          maxThickness: initialSize,
          initialSize: initialSize,
          onThicknessChanged: (value) {},
        ),
      );

      testWidgets('Load widget', (tester) async {
        await tester.pumpWidget(page);
        expect(find.byType(CustomizationTextField), findsOneWidget);
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('Input px(num)', (tester) async {
        await tester.pumpWidget(page);
        final finder = find.byType(CustomizationTextField);
        await tester.enterText(finder, inputNum);
        expect(
          find.text('10.0'),
          findsOneWidget,
        );
      });

      testWidgets('Validation input length', (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(
          find.byType(CustomizationTextField),
          inputValidation,
        );
        expect(find.text(inputValidation), findsNothing);
      });

      testWidgets('Input px(not num)', (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(find.byType(CustomizationTextField), inputText);
        expect(find.text(inputText), findsNothing);
      });
    },
  );
}
