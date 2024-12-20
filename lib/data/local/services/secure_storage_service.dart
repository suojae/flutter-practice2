import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final class SecureStorageService {
  final FlutterSecureStorage _secureStorage;

  SecureStorageService() : _secureStorage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  Future<void> saveAccessToken(String token) async {
    if (JwtDecoder.isExpired(token)) {
      throw Exception("Access token is expired");
    }
    await _secureStorage.write(key: _accessTokenKey, value: token);
  }

  Future<void> saveRefreshToken(String token) async {
    if (JwtDecoder.isExpired(token)) {
      throw Exception("Refresh token is expired");
    }
    await _secureStorage.write(key: _refreshTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    final token = await _secureStorage.read(key: _accessTokenKey);
    if (token != null && JwtDecoder.isExpired(token)) {
      await _secureStorage.delete(key: _accessTokenKey);
      return null;
    }
    return token;
  }

  Future<String?> getRefreshToken() async {
    final token = await _secureStorage.read(key: _refreshTokenKey);
    if (token != null && JwtDecoder.isExpired(token)) {
      await _secureStorage.delete(key: _refreshTokenKey);
      return null;
    }
    return token;
  }

  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }
}
