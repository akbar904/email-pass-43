
import 'package:bloc/bloc.dart';

// AuthState definition
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthLoggedOut extends AuthState {}

// AuthCubit definition
class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void logout() {
		emit(AuthLoading());
		// Perform logout logic here (e.g., clearing user session, tokens, etc.)
		// For now, we immediately emit AuthLoggedOut for simplicity
		emit(AuthLoggedOut());
	}
}
