
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_app/cubits/auth_state.dart';

void main() {
	group('AuthState', () {
		test('supports value comparisons', () {
			expect(AuthInitial(), AuthInitial());
			expect(AuthLoading(), AuthLoading());
			expect(AuthAuthenticated(), AuthAuthenticated());
			expect(AuthUnauthenticated(), AuthUnauthenticated());
		});
	});
}
