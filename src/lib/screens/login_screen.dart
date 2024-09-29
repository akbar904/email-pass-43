
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app/cubits/login_cubit.dart';

class LoginScreen extends StatefulWidget {
	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					children: [
						TextField(
							controller: _emailController,
							decoration: InputDecoration(
								labelText: 'Email',
								border: OutlineInputBorder(),
							),
						),
						SizedBox(height: 16.0),
						TextField(
							controller: _passwordController,
							obscureText: true,
							decoration: InputDecoration(
								labelText: 'Password',
								border: OutlineInputBorder(),
							),
						),
						SizedBox(height: 16.0),
						ElevatedButton(
							onPressed: () {
								final email = _emailController.text;
								final password = _passwordController.text;
								BlocProvider.of<LoginCubit>(context).login(email, password);
							},
							child: Text('Login'),
						),
					],
				),
			),
		);
	}
}
