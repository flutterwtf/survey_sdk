import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

import '../app_tester.dart';

void main() {
  group('SwitchCustomizationItem', () {
    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(
        const AppTester(
          child: SwitchCustomizationItem(
            title: 'switch_item',
          ),
        ),
      );

      expect(find.text('switch_item'), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('Toggle switch', (tester) async {
      var toggled = false;
      await tester.pumpWidget(
        AppTester(
          child: SwitchCustomizationItem(
            title: 'switch_item',
            onChanged: ({required bool isToggled}) {
              toggled = isToggled;
            },
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(toggled, true);

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(toggled, false);
    });

    testWidgets('Toggle initially active switch', (tester) async {
      var toggled = true;
      await tester.pumpWidget(
        AppTester(
          child: SwitchCustomizationItem(
            title: 'switch_item',
            initialValue: true,
            onChanged: ({required bool isToggled}) {
              toggled = isToggled;
            },
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(toggled, false);

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(toggled, true);
    });
  });
}
