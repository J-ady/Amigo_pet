import 'package:flutter_test/flutter_test.dart';
import 'package:jady_pet/main.dart';

void main() {
  testWidgets('AmigoPet inicia na tela de cuidadores', (
      WidgetTester tester,
      ) async {
    await tester.pumpWidget(const AmigoPetApp());

    expect(find.text('AmigoPet'), findsOneWidget);
    expect(find.text('Cuidadores disponíveis'), findsOneWidget);
    expect(find.text('Ana Silva'), findsOneWidget);
    expect(find.text('Carlos Oliveira'), findsOneWidget);
  });
}