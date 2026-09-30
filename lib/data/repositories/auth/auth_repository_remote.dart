import 'package:appwordcup2026/core/exceptions/app_exception.dart';
import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/data/repositories/auth/auth_repository.dart';
import 'package:appwordcup2026/data/services/api/auth_api.dart';
import 'package:appwordcup2026/data/services/api/mappers/auth_session_api_model_mapper.dart';
import 'package:appwordcup2026/data/services/api/mappers/dio_exception_mapper.dart';
import 'package:appwordcup2026/data/services/api/model/login/login_request.dart';
import 'package:appwordcup2026/domain/models/auth_session.dart';
import 'package:dio/dio.dart';

class AuthRepositoryRemote({required final AuthApi _authApi}) implements AuthRepository {
  
  @override
  Future<Result<AuthSession>> login({required String email, required String password}) async{
    try {
      final session = await _authApi.login(LoginRequest(email: email, password: password));
      return Result.ok(session.toDomain());
    } on DioException catch (e,st) {
      if(e.response?.statusCode == 401){
        return Result.error(InvalidCredentialsException(cause: e, stackTrace: st));
      }
      return Result.error(e.toAppException(st));
    }
  }
  
}