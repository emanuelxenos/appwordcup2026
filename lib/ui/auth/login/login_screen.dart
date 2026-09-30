import 'package:appwordcup2026/ui/auth/login/widgets/emblem.dart';
import 'package:appwordcup2026/ui/auth/login/widgets/header.dart';
import 'package:appwordcup2026/ui/auth/login/widgets/login_form.dart';
import 'package:appwordcup2026/ui/core/theme/app_dimens.dart';
import 'package:appwordcup2026/ui/core/theme/app_text_styles.dart';
import 'package:appwordcup2026/ui/core/theme/appcolors.dart';
import 'package:material_ui/material_ui.dart';

class const LoginScreen({super.key}) extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Header(),
          SafeArea(
            child: Column(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    const SizedBox(height: 20),
                    Emblem(),
                    const SizedBox(height: 26),
                    Text(
                      'FIFA WORLD CUP 26™',
                      style: AppTextStyles.overline,
                      textAlign: .center,
                    ),
                    const SizedBox(height: 36),
                    Padding(
                      padding: .symmetric(
                        horizontal: AppDimens.paddingHorizontal,
                      ),
                      child: LoginForm(),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.ink,
                    textStyle: AppTextStyles.bodyBold,
                  ),
                  onPressed: () {},
                  child: Text('Não tem conta?  Criar conta →'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}