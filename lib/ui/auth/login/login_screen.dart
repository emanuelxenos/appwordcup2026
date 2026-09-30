import 'package:appwordcup2026/core/exceptions/command.dart';
import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/ui/auth/login/login_viewmodel.dart';
import 'package:appwordcup2026/ui/auth/login/widgets/emblem.dart';
import 'package:appwordcup2026/ui/auth/login/widgets/header.dart';
import 'package:appwordcup2026/ui/auth/login/widgets/login_form.dart';
import 'package:appwordcup2026/ui/core/share/app_loading.dart';
import 'package:appwordcup2026/ui/core/theme/app_dimens.dart';
import 'package:appwordcup2026/ui/core/theme/app_text_styles.dart';
import 'package:appwordcup2026/ui/core/theme/appcolors.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class const LoginScreen({super.key, required final LoginViewmodel viewmodel}) extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

final _emailEC = TextEditingController();
final _passwordEC = TextEditingController();


@override
  void initState() {
    super.initState();
    widget.viewmodel.login.addListener(_onLoginResult);
  }

void _onLoginResult(){
  
  final command = widget.viewmodel.login;

  if(command.running){
    showDialog(context: context, builder: (context) {
      return Center(child: AppLoading(),);
    },);
  }

  if(command.result != null){
    Navigator.pop(context);
  }

  if(command.result case Error(:final error)){
    command.clearResult();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao realizer o login')));
  }

  if(command.result is Ok){
    context.go('/home', extra: widget.viewmodel.name);
  }

}

@override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    widget.viewmodel.login.removeListener(_onLoginResult);
  }

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
                      child: ListenableBuilder(
                        listenable: Listenable.merge([
                          _emailEC, _passwordEC
                        ]),
                        builder: (context,_) {
                          final preechido = _emailEC.text.trim().isNotEmpty && _passwordEC.text.trim().isNotEmpty;

                          return LoginForm(
                            emailController: _emailEC,
                            passwordController: _passwordEC,
                            onSubmit: preechido ? () { 
                              final arguments = (_emailEC.text.trim(), _passwordEC.text.trim());
                              widget.viewmodel.login.execute(arguments);
                             }: null,);
                        }
                      ),
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