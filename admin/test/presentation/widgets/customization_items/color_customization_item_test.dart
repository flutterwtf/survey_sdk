import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';

import '../app_tester.dart';

void main() {
  group('Color customization item widget', () {
    const redColorCode = 'FFF44336';
    const redColor = Colors.red;
    testWidgets('load widget', (tester) async {
      await tester.pumpWidget(
        AppTester(
          child: ColorCustomizationItem(
            initialColor: redColor,
            onColorPicked: (Color value) {},
          ),
        ),
      );
      expect(find.text(redColorCode), findsOneWidget);
    });

    testWidgets('open color picker', (tester) async {
      await tester.pumpWidget(
        AppTester(
          child: ColorCustomizationItem(
            initialColor: redColor,
            onColorPicked: (Color value) {},
          ),
        ),
      );
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      expect(find.byType(ColorPicker), findsOneWidget);
    });

    testWidgets('pick color', (tester) async {
      await tester.pumpWidget(
        AppTester(
          child: ColorCustomizationItem(
            initialColor: redColor,
            onColorPicked: (Color value) {},
          ),
        ),
      );
      expect(find.text(redColorCode), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      await tester.tap(find.byType(ColorPicker), warnIfMissed: false);
      await tester.pump();
      expect(find.text(redColorCode), findsNothing);
    });
  });
}
