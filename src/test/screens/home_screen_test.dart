
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:your_project/screens/home_screen.dart';
import 'package:your_project/cubits/auth_cubit.dart';
import 'package:your_project/cubits/auth_state.dart';

// Create a Mock class for AuthCubit
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('displays a Logout button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(
				home: HomeScreen(authCubit: mockAuthCubit),
			));

			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('calls logout on AuthCubit when Logout button is tapped', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(
				home: HomeScreen(authCubit: mockAuthCubit),
			));

			await tester.tap(find.text('Logout'));
			await tester.pump();

			verify(() => mockAuthCubit.logout()).called(1);
		});
	});

	group('HomeScreen Cubit Tests', () {
		blocTest<MockAuthCubit, AuthState>(
			'emits [] when nothing is added',
			build: () => MockAuthCubit(),
			expect: () => [],
		);

		blocTest<MockAuthCubit, AuthState>(
			'emits [AuthUnauthenticated] when logout is called',
			build: () => MockAuthCubit(),
			act: (cubit) => cubit.logout(),
			expect: () => [AuthUnauthenticated()],
		);
	});
}
