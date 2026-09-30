import 'package:appwordcup2026/ui/auth/login/login_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class const LoginBindings ({super.key, required final WidgetBuilder screenBuilder}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginViewmodel(authRepository: context.read()),),
    ],
    builder:(context, child) => screenBuilder(context),
    );
  }
}