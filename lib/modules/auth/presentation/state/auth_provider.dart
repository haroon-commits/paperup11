import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/core/auth/token_storage.dart';
import 'package:paperup1/modules/auth/data/models/user_model.dart';
import 'package:paperup1/modules/auth/data/repositories/mock_auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => MockAuthRepository());
final tokenStorageProvider = Provider((ref) => TokenStorage());

class AuthState {
  final UserModel? user;
  final bool isLoading;
  final String? error;

  AuthState({this.user, this.isLoading = false, this.error});

  AuthState copyWith({UserModel? user, bool? isLoading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    _init();
    return AuthState();
  }

  Future<void> _init() async {
    final storage = ref.read(tokenStorageProvider);
    final role = await storage.getRole();
    if (role != null) {
      state = state.copyWith(
        user: UserModel(
          id: 0,
          name: 'Welcome Back',
          email: '',
          role: role,
        ),
      );
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(authRepositoryProvider);
      final storage = ref.read(tokenStorageProvider);
      final response = await repository.login(email, password);
      await storage.saveToken(response.token);
      await storage.saveRole(response.user.role);
      state = state.copyWith(user: response.user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> logout() async {
    final storage = ref.read(tokenStorageProvider);
    await storage.clearAuthData();
    state = AuthState();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
