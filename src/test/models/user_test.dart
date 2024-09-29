
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_app/models/user.dart';

void main() {
	group('User Model Tests', () {
		test('User model should be instantiated correctly', () {
			final user = User(email: 'test@example.com', password: 'password123');
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});

		test('User model should support value equality', () {
			final user1 = User(email: 'test@example.com', password: 'password123');
			final user2 = User(email: 'test@example.com', password: 'password123');
			expect(user1, equals(user2));
		});

		test('User model toJson should work correctly', () {
			final user = User(email: 'test@example.com', password: 'password123');
			expect(user.toJson(), {'email': 'test@example.com', 'password': 'password123'});
		});

		test('User model fromJson should work correctly', () {
			final userJson = {'email': 'test@example.com', 'password': 'password123'};
			final user = User.fromJson(userJson);
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});

		test('User model toString should return correct string', () {
			final user = User(email: 'test@example.com', password: 'password123');
			expect(user.toString(), 'User(email: test@example.com, password: password123)');
		});
	});
}
