
import 'package:appwordcup2026/core/exceptions/command.dart';
import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/data/repositories/auth/auth_repository.dart';
import 'package:appwordcup2026/domain/models/auth_session.dart';
import 'package:flutter/widgets.dart';

class LoginViewmodel({required final AuthRepository _authRepository}) extends ChangeNotifier{
  
  late final login = Command1<void,(String, String)>(_login);
  String name = '';
  
  Future<Result<void>> _login((String, String) credentials) async {
    final (email, password) = credentials;

    final result = await _authRepository.login(email: email, password: password);

    switch(result) {
      case Ok<AuthSession>(:final value):
        name = value.user.name;
        return Result.done;
      case Error<AuthSession>(:final error):
        return Result.error(error);
    }
  }


}