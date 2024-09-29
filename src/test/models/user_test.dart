
// test/models/user_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_app/models/user.dart';

void main() {
	group('User Model', () {
		test('User should be instantiated properly', () {
			final user = User(id: '123', email: 'test@example.com');
			expect(user.id, '123');
			expect(user.email, 'test@example.com');
		});
		
		test('User should be serialized to and from JSON correctly', () {
			final user = User(id: '123', email: 'test@example.com');
			final json = user.toJson();
			
			expect(json['id'], '123');
			expect(json['email'], 'test@example.com');
			
			final userFromJson = User.fromJson(json);
			expect(userFromJson.id, '123');
			expect(userFromJson.email, 'test@example.com');
		});
	});
}
