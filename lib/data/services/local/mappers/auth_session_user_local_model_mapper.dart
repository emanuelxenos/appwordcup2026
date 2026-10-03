import 'package:appwordcup2026/data/services/local/model/auth_session_user_local_model.dart';
import 'package:appwordcup2026/domain/models/auth_session.dart';

extension AuthSessionUserLocalModelMapper on AuthSessionUserLocalModel {
  AuthSessionUser toDomain() => AuthSessionUser(name: name, email: email);
}
