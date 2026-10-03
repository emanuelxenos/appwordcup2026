import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:appwordcup2026/core/view_model_initializable.dart';
import 'package:appwordcup2026/ui/auth/register/register_viewmodel.dart';

class const RegisterBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterViewModel(
            authRepository: context.read(),
            teamRepository: context.read(),
          ).initialized(),
        ),
      ],
      builder: (context, child) => screenBuilder(context),
    );
  }
}
