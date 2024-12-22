import 'package:fire_walker/presentation/sign_in_page/sign_in_viemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as apple;
import '../../design/cutom_rive.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

final class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInBloc()..add(const SignInEvent.autoSignIn()),
      child: Scaffold(
        backgroundColor: const Color(0xFF0E091C),
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () => Navigator.of(context).pushReplacementNamed('/step'),
              error: (message) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              ),
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                // 중앙 상단 앱 타이틀
                const Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                    child: Text(
                      'Fire Walker',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // 중앙 Rive 애니메이션
                Expanded(
                  child: Center(
                    child: RiveWidget.fireWalker(270, 270),
                  ),
                ),

                // 하단 소셜 로그인 버튼들
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final oAuthToken = await UserApi.instance.loginWithKakaoAccount();
                            TokenManagerProvider.instance.manager.setToken(oAuthToken);

                            final user = await UserApi.instance.me();
                            final socialId = user.id.toString();

                            BlocProvider.of<SignInBloc>(context).add(
                              SignInEvent.signInWithKakao(socialId: socialId),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Kakao Login Failed: $e')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFE812),
                          foregroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
                          shadowColor: Colors.white.withOpacity(0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/kakao.png",
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Sign in with Kakao',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final credential = await apple.SignInWithApple.getAppleIDCredential(
                              scopes: [
                                apple.AppleIDAuthorizationScopes.email,
                                apple.AppleIDAuthorizationScopes.fullName,
                              ],
                            );

                            final socialId = credential.userIdentifier;
                            if (socialId != null) {
                              BlocProvider.of<SignInBloc>(context).add(
                                SignInEvent.signInWithApple(socialId: socialId),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Apple Login Failed: No social ID')),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Apple Login Failed: $e')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
                          shadowColor: Colors.white.withOpacity(0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.apple, size: 24, color: Colors.white),
                            const SizedBox(width: 10),
                            const Text(
                              'Sign in with Apple',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
              ],
            );
          },
        ),
      ),
    );
  }
}
