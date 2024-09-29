
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc/bloc.dart';
import 'package:your_app/cubits/login_cubit.dart';

// Mock dependencies if any (for example, a repository)
class MockUserRepository extends Mock implements UserRepository {}

void main() {
	group('LoginCubit', () {
		late LoginCubit loginCubit;
		late MockUserRepository mockUserRepository;

		setUp(() {
			mockUserRepository = MockUserRepository();
			loginCubit = LoginCubit(userRepository: mockUserRepository);
		});

		tearDown(() {
			loginCubit.close();
		});

		test('initial state is LoginInitial', () {
			expect(loginCubit.state, equals(LoginInitial()));
		});

		blocTest<LoginCubit, LoginState>(
			'emit [LoginLoading, LoginSuccess] when login is successful',
			build: () {
				when(() => mockUserRepository.authenticate(any(), any()))
					.thenAnswer((_) async => User(id: '1', email: 'test@example.com'));
				return loginCubit;
			},
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [LoginLoading(), LoginSuccess()],
		);

		blocTest<LoginCubit, LoginState>(
			'emit [LoginLoading, LoginFailure] when login fails',
			build: () {
				when(() => mockUserRepository.authenticate(any(), any()))
					.thenThrow(Exception('Authentication failed'));
				return loginCubit;
			},
			act: (cubit) => cubit.login('test@example.com', 'wrongpassword'),
			expect: () => [LoginLoading(), LoginFailure(error: 'Authentication failed')],
		);
	});
}
