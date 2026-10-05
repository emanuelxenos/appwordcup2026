import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:appwordcup2026/config/application_bindings.dart';
import 'package:appwordcup2026/core/logging/app_logger.dart';
import 'package:appwordcup2026/core/logging/log_output.dart';
import 'package:appwordcup2026/ui/core/theme/theme.dart';

void main() {
  AppLogger.configure(
    level: kDebugMode ? Level.ALL : Level.INFO,
    outputs: const [ConsoleLogOutput()],
  );
  runApp(const ApplicationBindings(child: MainApp()));
}

class const MainApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MaterialUiCompatibilityBridge(child: child!);
      },
      routerConfig: context.read<GoRouter>(),
    );
  }
}
