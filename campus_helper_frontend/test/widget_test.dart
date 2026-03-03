import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:campus_helper_frontend/main.dart';

void main() {
  testWidgets('App loads and shows CGPA screen by default', (WidgetTester tester) async {
    await tester.pumpWidget(const CampusHelperApp());

    // First pump triggers async store initialization; allow it to settle.
    await tester.pumpAndSettle();

    expect(find.text('CGPA Calculator'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Calculate'), findsOneWidget);
  });

  testWidgets('Bottom navigation switches between calculators', (WidgetTester tester) async {
    await tester.pumpWidget(const CampusHelperApp());
    await tester.pumpAndSettle();

    // Attendance tab.
    await tester.tap(find.text('Attendance'));
    await tester.pumpAndSettle();
    expect(find.text('Attendance'), findsOneWidget);

    // Internals tab.
    await tester.tap(find.text('Internals'));
    await tester.pumpAndSettle();
    expect(find.text('Internal Marks'), findsOneWidget);

    // Back to CGPA.
    await tester.tap(find.text('CGPA'));
    await tester.pumpAndSettle();
    expect(find.text('CGPA Calculator'), findsOneWidget);
  });
}
