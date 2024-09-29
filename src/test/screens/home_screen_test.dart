
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:com.example.simple_app/screens/home_screen.dart';
import 'package:com.example.simple_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays a logout button', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();
			when(() => mockAuthCubit.state).thenReturn(Authenticated());

			// Act
			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (context) => mockAuthCubit,
					child: MaterialApp(
						home: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('calls logout when the logout button is pressed', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();
			when(() => mockAuthCubit.state).thenReturn(Authenticated());
			when(() => mockAuthCubit.logout()).thenReturn(null);

			// Act
			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (context) => mockAuthCubit,
					child: MaterialApp(
						home: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Logout'));
			await tester.pump();

			// Assert
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
