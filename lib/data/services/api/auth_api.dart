import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:appwordcup2026/data/services/api/interceptors/auth_interceptor.dart';
import 'package:appwordcup2026/data/services/api/model/auth/auth_session_api_model.dart';
import 'package:appwordcup2026/data/services/api/model/login/login_request.dart';
import 'package:appwordcup2026/data/services/api/model/user/register_user_request.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/v1/auth/login')
  @Extra(AuthInterceptor.publicRoute)
  Future<AuthSessionApiModel> login(@Body() LoginRequest request);

  @POST('/v1/users')
  @Extra(AuthInterceptor.publicRoute)
  Future<void> register(@Body() RegisterUserRequest request);
}
