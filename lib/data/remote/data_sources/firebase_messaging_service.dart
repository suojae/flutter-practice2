import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

final class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // FCM Token 생성
  Future<String?> getFcmToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      print('Generated FCM Token: $token');
      return token;
    } catch (e) {
      print('Error generating FCM Token: $e');
      return null;
    }
  }

  // FCM Token 갱신
  void setupTokenRefreshListener() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      print('FCM Token refreshed: $newToken');
      // 서버로 갱신된 토큰 전송
      _registerTokenToBackend(newToken);
    });
  }

  // 백엔드로 FCM Token 전송
  Future<void> _registerTokenToBackend(String token) async {
    const url = 'http://localhost:3000/notification';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: '{"fcmToken": "$token"}',
      );

      if (response.statusCode == 200) {
        print('FCM Token registered successfully');
      } else {
        print('Failed to register FCM Token: ${response.body}');
      }
    } catch (e) {
      print('Error registering FCM Token to backend: $e');
    }
  }
}
