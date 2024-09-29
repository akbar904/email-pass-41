
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_app/main.dart';

void main() {
	group('MainApp', () {
		testWidgets('renders LoginScreen initially', (WidgetTester tester) async {
			await tester.pumpWidget(MainApp());

			expect(find.text('Login Screen'), findsOneWidget);
		});
	});

	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, AuthInitial());
		});

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthAuthenticated] when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [AuthLoading(), AuthAuthenticated()],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthUnauthenticated] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [AuthLoading(), AuthUnauthenticated()],
		);
	});
}
