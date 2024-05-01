
import 'package:mobile_app/src/features/auth/interactor/states/auth_state.dart';

abstract interface class AuthService {
  Future<AuthState> login(String email, String password);

  Future<AuthState> logout();

  AuthState getUser();
}