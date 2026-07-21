import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CollapsibleSidebar renders without RenderFlex overflow when collapsed',
      (WidgetTester tester) async {
    final items = [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.dashboard,
        onPressed: () {},
        isSelected: true,
        subItems: [
          CollapsibleItem(
            text: 'Sub Item',
            icon: Icons.star,
            onPressed: () {},
          ),
        ],
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () {},
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CollapsibleSidebar(
            items: items,
            isCollapsed: true,
            minWidth: 80,
            body: Container(color: Colors.white),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('CollapsibleSidebar renders without RenderFlex overflow in very narrow constraints',
      (WidgetTester tester) async {
    final items = [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.dashboard,
        onPressed: () {},
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 20,
            child: CollapsibleSidebar(
              items: items,
              isCollapsed: true,
              minWidth: 20,
              body: Container(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
