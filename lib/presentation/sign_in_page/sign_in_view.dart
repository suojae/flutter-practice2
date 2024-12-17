import 'package:fire_walker/presentation/sign_in_page/sign_in_viemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../design/cutom_rive.dart';


final class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(signInViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0E091C),
      body: Column(
        children: [
          // 중앙 상단 앱 타이틀
          const Padding(
            padding: EdgeInsets.only(top: 150),
            child: Center(
              child: Text(
                'Fire Runner',
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
                _SocialSignInButton(
                  label: 'Sign in with Kakao',
                  icon: Image.asset(
                    "images/kakao.png",
                    width: 24,
                    height: 24,
                  ),
                  color: const Color(0xFFFFE812),
                  textColor: Colors.black,
                  onPressed: () => viewModel.signInWithKakao(),
                ),
                const SizedBox(height: 30),

                _SocialSignInButton(
                  label: 'Sign in with Apple',
                  icon: const Icon(Icons.apple, size: 24, color: Colors.white),
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () => viewModel.signInWithApple(),
                ),

              ],
            ),
          ),
          const SizedBox(height: 150),
        ],
      ),
    );
  }
}

class _SocialSignInButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const _SocialSignInButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      label: Text(
        label,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        shadowColor: Colors.white.withOpacity(0.1),
      ),
    );
  }
}
