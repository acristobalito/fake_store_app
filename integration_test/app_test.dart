import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fake_store_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login flow test', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CustomButtonAtom).first);
    await tester.pumpAndSettle();
    final userField = find.byType(TextFormField).at(0);
    final passwordFiel = find.byType(TextFormField).at(1);
    await tester.enterText(userField, 'mor_2314');
    await tester.pumpAndSettle();
    await tester.enterText(passwordFiel, '83r5^_');
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CustomButtonAtom));
    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.byType(MainScreen), findsOneWidget);
  });
}
