import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/domain/models/auth_session.dart';

abstract interface class AuthRepository {
  Future<Result<AuthSession>> login({required String email, required String password});
}