import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_common_customization_tab.dart';

import '../app_test.dart';

void main() {
  group(
    'Intro common customization tab tests',
    () {
      final page = AppTest(
        child: IntroCommonCustomizationTab(
          title: 'title',
          onFillColorPicked: (value) {},
          onTitleColorPicked: (value) {},
          onTitleFontSizeChanged: (value) {},
          onSubtitleColorPicked: (value) {},
          onSubtitleFontSizeChanged: (value) {},
          onButtonColorPicked: (value) {},
          onButtonTextColorPicked: (value) {},
          onButtonFontSizeChanged: (value) {},
          onButtonRadiusChanged: (value) {},
        ),
      );

      testWidgets(
        'All content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();
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
            find.widgetWithText(CustomizationItemsContainer, 'Button'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
