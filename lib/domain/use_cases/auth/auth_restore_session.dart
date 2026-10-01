
import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/data/repositories/auth_session/auth_session_repository.dart';
import 'package:appwordcup2026/domain/models/auth_session.dart';

class AuthRestoreSessionUseCase({
  required final AuthSessionRepository _authSessionRepository,
}) {
  Future<Result<AuthSessionUser?>> restore() async {
    final session = await _authSessionRepository.fetch();
    return switch (session) {
      Ok<AuthSession?>(:final value) => Result.ok(value?.user),
      Error<AuthSession?>(:final error) => Result.error(error),
    };
  }
}