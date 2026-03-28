import 'package:flutter_test/flutter_test.dart';
import 'package:youtube_lite/main.dart';

void main() {
  testWidgets('YouTubeLiteApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const YouTubeLiteApp());
    expect(find.text('YouTube Lite'), findsOneWidget);
  });
}
