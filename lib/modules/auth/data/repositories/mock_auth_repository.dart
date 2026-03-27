import 'package:paperup1/modules/auth/data/models/user_model.dart';
import 'package:paperup1/modules/auth/data/models/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(String email, String password);
}

class MockAuthRepository implements AuthRepository {
  @override
  Future<LoginResponse> login(String email, String password) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    // Handle dummy logic for role-based testing
    String role = 'student';
    if (email.contains('teacher')) {
      role = 'teacher';
    } else if (email.contains('parent')) {
      role = 'parent';
    }

    return LoginResponse(
      token: 'mock_jwt_token_123',
      user: UserModel(
        id: 1,
        name: role.toUpperCase(),
        email: email,
        role: role,
        avatarUrl: 'https://i.pravatar.cc/150?u=$email',
      ),
    );
  }
}
