import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

import '../app_test.dart';

void main() {
  group('SwitchCustomizationItem', () {
    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(
        const AppTest(
          child: SwitchCustomizationItem(
            title: 'switch_item',
          ),
        ),
      );

      expect(find.text('switch_item'), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('Toggle switch', (tester) async {
      var isToggled = false;
      await tester.pumpWidget(
        AppTest(
          child: SwitchCustomizationItem(
            title: 'switch_item',
            onChanged: (newIsToggled) {
              isToggled = newIsToggled;
            },
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(isToggled, true);

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(isToggled, false);
    });

    testWidgets('Toggle initially active switch', (tester) async {
      var isToggled = true;
      await tester.pumpWidget(
        AppTest(
          child: SwitchCustomizationItem(
            title: 'switch_item',
            initialValue: true,
            onChanged: (newIsToggled) {
              isToggled = newIsToggled;
            },
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(isToggled, false);

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(isToggled, true);
    });
  });
}
