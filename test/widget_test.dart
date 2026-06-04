import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/features/home/presentation/screens/home_screen.dart';
import 'package:test_riverpod/app/app.dart';

void main() {
  testWidgets('renders app shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
