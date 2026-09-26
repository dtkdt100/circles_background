import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('Gallery opens a preset full screen', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());

    expect(find.text('Circles Background'), findsWidgets);
    expect(find.text('Ocean'), findsOneWidget);

    await tester.tap(find.text('Ocean'));
    await tester.pumpAndSettle();

    expect(find.text('Your content here'), findsOneWidget);

    await tester.tap(find.byTooltip('View code'));
    await tester.pumpAndSettle();

    expect(find.text('Ocean code'), findsOneWidget);
  });
}
