
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_project/cubits/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
	final AuthCubit authCubit;

	HomeScreen({required this.authCubit});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: ElevatedButton(
					onPressed: () {
						authCubit.logout();
					},
					child: Text('Logout'),
				),
			),
		);
	}
}
