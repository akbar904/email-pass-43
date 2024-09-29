
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:simple_app/main.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
	group('MyApp', () {
		testWidgets('Renders MyApp and verifies the initial route', (WidgetTester tester) async {
			// Arrange
			final mockObserver = MockNavigatorObserver();
			
			// Act
			await tester.pumpWidget(MyApp());
			await tester.pumpAndSettle();
			
			// Assert
			expect(find.byType(MyApp), findsOneWidget);
			verify(() => mockObserver.didPush(any(), any())).called(1);
		});
	});
}
