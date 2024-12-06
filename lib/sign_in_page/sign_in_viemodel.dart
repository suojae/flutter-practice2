import 'package:flutter_riverpod/flutter_riverpod.dart';

/// SignInViewModel의 프로바이더
final signInViewModelProvider = Provider<SignInViewModel>((ref) {
  return SignInViewModel();
});

class SignInViewModel {
  /// Apple 로그인 메서드 (현재는 로그 출력)
  void signInWithApple() {
    print('Apple Sign-In pressed');
  }

  /// Kakao 로그인 메서드 (현재는 로그 출력)
  void signInWithKakao() {
    print('Kakao Sign-In pressed');
  }
}
