
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_app/models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());
    // Simulate a network call
    await Future.delayed(Duration(seconds: 1));
    // In a real app, you would authenticate against a backend here
    if (email == 'test@example.com' && password == 'password123') {
      emit(AuthAuthenticated(User(email: email, password: password)));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void logout() {
    emit(AuthUnauthenticated());
  }
}
