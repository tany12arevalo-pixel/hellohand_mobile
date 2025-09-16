import 'package:flutter_test/flutter_test.dart';
import 'package:hellohand_mobile/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const HelloHandApp());
    expect(find.text('HelloHand'), findsOneWidget);
  });
}