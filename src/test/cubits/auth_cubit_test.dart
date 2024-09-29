
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_app/cubits/auth_cubit.dart';
import 'package:your_app/cubits/auth_state.dart';

// Mocking dependencies if any
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, AuthInitial());
		});

		blocTest<AuthCubit, AuthState>(
			'login emits [AuthLoading, AuthAuthenticated] when successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [AuthLoading(), AuthAuthenticated()],
		);

		blocTest<AuthCubit, AuthState>(
			'logout emits [AuthUnauthenticated]',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [AuthUnauthenticated()],
		);
	});
}
