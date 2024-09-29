
// test/login_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_app/screens/login_screen.dart';
import 'package:com.example.simple_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_app/cubits/auth_state.dart';

// Mocking AuthCubit
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		late MockAuthCubit mockAuthCubit;
		
		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});
		
		testWidgets('should display email and password fields', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(authCubit: mockAuthCubit),
				),
			);
			expect(find.byKey(Key('emailField')), findsOneWidget);
			expect(find.byKey(Key('passwordField')), findsOneWidget);
		});
		
		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(authCubit: mockAuthCubit),
				),
			);
			expect(find.byKey(Key('loginButton')), findsOneWidget);
		});
		
		testWidgets('should display error text when error is present', (WidgetTester tester) async {
			whenListen(
				mockAuthCubit,
				Stream.fromIterable([AuthUnauthenticated('Invalid credentials')]),
				initialState: AuthInitial(),
			);
			
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(authCubit: mockAuthCubit),
				),
			);
			await tester.pump();
			
			expect(find.text('Invalid credentials'), findsOneWidget);
		});
		
		testWidgets('tapping login button calls login on AuthCubit', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(authCubit: mockAuthCubit),
				),
			);
			
			await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
			await tester.enterText(find.byKey(Key('passwordField')), 'password');
			await tester.tap(find.byKey(Key('loginButton')));
			await tester.pump();
			
			verify(() => mockAuthCubit.login('test@example.com', 'password')).called(1);
		});
	});
}
