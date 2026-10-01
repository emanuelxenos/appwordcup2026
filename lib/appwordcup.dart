import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import 'ui/core/theme/app_theme.dart';

class const MainApp({super.key}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      builder: (context, child) {
        return MaterialUiCompatibilityBridge(child: child!);
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: context.read<GoRouter>(),
    );
  }

}