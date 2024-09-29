
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
	final UserRepository userRepository;

	LoginCubit({required this.userRepository}) : super(LoginInitial());

	void login(String email, String password) async {
		try {
			emit(LoginLoading());
			final user = await userRepository.authenticate(email, password);
			emit(LoginSuccess(user: user));
		} catch (e) {
			emit(LoginFailure(error: e.toString()));
		}
	}
}
