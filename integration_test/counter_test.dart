import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yandex_flutter_handbook/simple_counter_app.dart';

import '../test/screenshot.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("counter increments when button is tapped", (tester) async {
    final shot = screenshot(tester, binding);
    io.Directory('integration_test/screenshots').createSync(recursive: true);

    await tester.pumpWidget(const CounterWidget());

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Tap the button
    await tester.tap(find.byKey(ValueKey('incrementButton')));
    await tester.pumpAndSettle();

    // Verify counter updated
    expect(find.text('1'), findsOneWidget);

    final appScreenshot = await shot('app');
    io.File('integration_test/screenshots/app.png').writeAsBytesSync(appScreenshot);
  });
}
