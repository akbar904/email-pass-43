
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app/screens/login_screen.dart';

// Mock Cubit
class MockLoginCubit extends Mock implements LoginCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		// Define MockLoginCubit
		late MockLoginCubit mockLoginCubit;

		setUp(() {
			mockLoginCubit = MockLoginCubit();
		});

		testWidgets('LoginScreen shows Email and Password fields and Login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<LoginCubit>(
						create: (_) => mockLoginCubit,
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2)); // Email and Password fields
			expect(find.byType(ElevatedButton), findsOneWidget); // Login button
			expect(find.text('Login'), findsOneWidget); // Login button text
		});

		testWidgets('Tapping Login button triggers login method', (WidgetTester tester) async {
			when(() => mockLoginCubit.login(any(), any())).thenAnswer((_) async {});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<LoginCubit>(
						create: (_) => mockLoginCubit,
						child: LoginScreen(),
					),
				),
			);

			await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
			await tester.enterText(find.byType(TextField).at(1), 'password');
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => mockLoginCubit.login('test@example.com', 'password')).called(1);
		});
	});

	group('LoginCubit Tests', () {
		// Add your LoginCubit tests here if login_cubit.dart is within the scope of lib/screens/login_screen.dart
		// For this example, we assume the LoginCubit is already tested separately
	});
}
