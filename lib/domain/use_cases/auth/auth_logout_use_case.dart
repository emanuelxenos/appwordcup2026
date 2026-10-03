import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/data/repositories/auth_session/auth_session_repository.dart';

class AuthLogoutUseCase({
  required final AuthSessionRepository _authSessionRepository,
}) {
  Future<Result<void>> logout() => _authSessionRepository.delete();
}
