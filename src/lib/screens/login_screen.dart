
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_app/cubits/auth_state.dart';

class LoginScreen extends StatefulWidget {
	final AuthCubit authCubit;
	
	LoginScreen({required this.authCubit});
	
	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	
	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: BlocConsumer<AuthCubit, AuthState>(
				bloc: widget.authCubit,
				listener: (context, state) {
					if (state is AuthUnauthenticated && state.message.isNotEmpty) {
						ScaffoldMessenger.of(context).showSnackBar(
							SnackBar(
								content: Text(state.message),
							),
						);
					}
				},
				builder: (context, state) {
					return Padding(
						padding: EdgeInsets.all(16.0),
						child: Column(
							children: [
								TextField(
									key: Key('emailField'),
									controller: _emailController,
									decoration: InputDecoration(labelText: 'Email'),
								),
								TextField(
									key: Key('passwordField'),
									controller: _passwordController,
									obscureText: true,
									decoration: InputDecoration(labelText: 'Password'),
								),
								SizedBox(height: 20),
								ElevatedButton(
									key: Key('loginButton'),
									onPressed: () {
										final email = _emailController.text;
										final password = _passwordController.text;
										widget.authCubit.login(email, password);
									},
									child: Text('Login'),
								),
								if (state is AuthUnauthenticated && state.message.isNotEmpty)
									Text(
										state.message,
										style: TextStyle(color: Colors.red),
									),
							],
						),
					);
				},
			),
		);
	}
}
