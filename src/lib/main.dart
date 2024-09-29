
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/login_cubit.dart';
import 'cubits/auth_cubit.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: [
				BlocProvider<LoginCubit>(
					create: (context) => LoginCubit(),
				),
				BlocProvider<AuthCubit>(
					create: (context) => AuthCubit(),
				),
			],
			child: MaterialApp(
				title: 'Simple App',
				initialRoute: '/',
				routes: {
					'/': (context) => LoginScreen(),
					'/home': (context) => HomeScreen(),
				},
			),
		);
	}
}
