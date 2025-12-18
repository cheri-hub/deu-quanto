// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:groceries_scanner/main.dart';
import 'package:groceries_scanner/providers/shopping_list_provider.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final shoppingListProvider = ShoppingListProvider();
    await tester.pumpWidget(MyApp(shoppingListProvider: shoppingListProvider));

    // Verify that the app starts
    expect(find.text('Lista de Compras'), findsOneWidget);
  });
}
