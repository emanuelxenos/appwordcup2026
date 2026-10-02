import 'dart:async';

import 'package:appwordcup2026/core/logging/app_logger.dart';
import 'package:appwordcup2026/data/services/api/local/secure_storage_service.dart';
import 'package:appwordcup2026/data/services/api/local/storage_keys.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this._storage});

  static const publicRoute = <String, Object>{_publicRouteKey: true};
  static const _publicRouteKey = 'publicRoute';
  static const _sessionEndedStatus = {401, 403};

  final SecureStorageService _storage;
  final _log = AppLogger('AuthInterceptor');
  final _unauthorized = StreamController<void>.broadcast();

  Stream<void> get onUnauthorized => _unauthorized.stream;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[_publicRouteKey] == true) {
      return handler.next(options);
    }

    final token = await _storage.fetch(StorageKeys.authToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_endsSession(err)) {
      _log.info('Backend recusou o token');
      _unauthorized.add(null);
    }
    handler.next(err);
  }

  bool _endsSession(DioException err) =>
      _sessionEndedStatus.contains(err.response?.statusCode) &&
      err.requestOptions.headers.containsKey('Authorization');

  void dispose() {
    unawaited(_unauthorized.close());
  }
}
