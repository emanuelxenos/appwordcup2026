import 'package:appwordcup2026/data/services/api/model/auth/auth_session_api_model.dart';
import 'package:appwordcup2026/domain/models/auth_session.dart';

extension AuthSessionApiModelMapper on AuthSessionApiModel {
  AuthSession toDomain() => AuthSession(token: token, user: user.toDomain());
}

extension AuthSessionUserApiModelMapper on AuthSessionUserApiModel {
  AuthSessionUser toDomain() => AuthSessionUser(name: name, email: email);
}
