import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fire_walker/presentation/sign_in_page/sign_in_event.dart';
import 'package:fire_walker/presentation/sign_in_page/sign_in_state.dart';

import '../../di_container.dart';
import '../../domain/usecases/auth_usecase.dart';
import '../../domain/usecases/auth_usecase.dart' show Provider, SignInResult;

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthUsecase _authUsecase = getIt<AuthUsecase>();

  SignInBloc() : super(const SignInState.initial()) {
    on<AutoSignIn>(_handleAutoSignIn);
    on<SignInWithKakao>(_handleSignInWithKakao);
    on<SignInWithApple>(_handleSignInWithApple);
  }

  /// 자동로그인
  Future<void> _handleAutoSignIn(
      AutoSignIn event,
      Emitter<SignInState> emit,
      ) async {
    emit(const SignInState.loading());
    try {
      final result = await _authUsecase.signIn();
      if (result == SignInResult.success) {
        emit(const SignInState.success());
      } else {
        emit(const SignInState.initial());
      }
    } catch (e) {
      emit(SignInState.error(e.toString()));
    }
  }

  /// 카카오 회원가입
  Future<void> _handleSignInWithKakao(
      SignInWithKakao event,
      Emitter<SignInState> emit,
      ) async {
    emit(const SignInState.loading());
    try {
      final token = await _authUsecase.signUp(event.socialId);
      emit(const SignInState.success());
    } catch (e) {
      emit(SignInState.error(e.toString()));
    }
  }

  /// 애플 회원가입
  Future<void> _handleSignInWithApple(
      SignInWithApple event,
      Emitter<SignInState> emit,
      ) async {
    emit(const SignInState.loading());
    try {
      final token = await _authUsecase.signUp(event.socialId);
      emit(const SignInState.success());
    } catch (e) {
      emit(SignInState.error(e.toString()));
    }
  }
}
