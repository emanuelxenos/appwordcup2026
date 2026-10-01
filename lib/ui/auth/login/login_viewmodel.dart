
import 'package:appwordcup2026/core/exceptions/command.dart';
import 'package:appwordcup2026/core/logging/app_logger.dart';
import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/domain/models/auth_session.dart';
import 'package:appwordcup2026/domain/use_cases/auth/auth_login_user_case.dart';
import 'package:flutter/widgets.dart';

class LoginViewmodel({required final AuthLoginUseCase _loginUseCase})
    extends ChangeNotifier {
  final _log = AppLogger('LoginViewModel');
  late final login = Command1<void, (String, String)>(_login);
  String name = '';

  Future<Result<void>> _login((String, String) credentials) async {
    final (email, password) = credentials;

    final result = await _loginUseCase.login(email: email, password: password);

    switch (result) {
      case Ok<AuthSessionUser>(:final value):
        name = value.name;
        return Result.done;
      case Error<AuthSessionUser>(:final error):
        _log.error(
          'Falha ao entrar',
          error: error,
          stackTrace: error.stackTrace,
        );
        return Result.error(error);
    }
  }
}