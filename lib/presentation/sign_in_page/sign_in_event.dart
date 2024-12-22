import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.freezed.dart';

@freezed
class SignInEvent with _$SignInEvent {
  /// 앱 실행시 자동로그인 시도 이벤트
  const factory SignInEvent.autoSignIn() = AutoSignIn;

  const factory SignInEvent.signInWithKakao({
    required String socialId,
  }) = SignInWithKakao;

  const factory SignInEvent.signInWithApple({
    required String socialId,
  }) = SignInWithApple;
}
