
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object> get props => [];
}

class AuthInitial extends AuthState {
	const AuthInitial();
}

class AuthLoading extends AuthState {
	const AuthLoading();
}

class AuthAuthenticated extends AuthState {
	const AuthAuthenticated();
}

class AuthUnauthenticated extends AuthState {
	const AuthUnauthenticated();
}