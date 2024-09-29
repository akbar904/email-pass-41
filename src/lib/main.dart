
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_screen.dart';
import 'cubits/auth_cubit.dart';
import 'cubits/auth_state.dart';

void main() {
	runApp(MainApp());
}

class MainApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Simple App',
			home: BlocProvider(
				create: (context) => AuthCubit(),
				child: AuthFlow(),
			),
		);
	}
}

class AuthFlow extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocListener<AuthCubit, AuthState>(
			listener: (context, state) {
				if (state is AuthAuthenticated) {
					Navigator.of(context).pushReplacement(
						MaterialPageRoute(builder: (context) => HomeScreen()),
					);
				} else if (state is AuthUnauthenticated) {
					Navigator.of(context).pushReplacement(
						MaterialPageRoute(builder: (context) => LoginScreen()),
					);
				}
			},
			child: LoginScreen(), // Initial screen
		);
	}
}
