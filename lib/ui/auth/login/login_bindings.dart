import 'package:appwordcup2026/domain/use_cases/auth/auth_login_user_case.dart';
import 'package:appwordcup2026/ui/auth/login/login_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class const LoginBindings ({super.key, required final WidgetBuilder screenBuilder}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (context) => AuthLoginUseCase(
      authRepository: context.read(),
      authSessionRepository: context.read(),
      ),),
      ChangeNotifierProvider(create: (context) => LoginViewmodel(loginUseCase: context.read()),),
    ],
    builder:(context, child) => screenBuilder(context),
    );
  }
}