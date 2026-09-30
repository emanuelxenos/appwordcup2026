import 'package:appwordcup2026/config/application_bindings.dart';
import 'package:appwordcup2026/core/logging/app_logger.dart';
import 'package:appwordcup2026/core/logging/log_output.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:material_ui/material_ui.dart';
import './appwordcup.dart';

void main() {
  AppLogger.configure(level:  kDebugMode ? Level.ALL : Level.INFO,  outputs: const [
    ConsoleLogOutput()
  ]);
  runApp(const ApplicationBindings(child: MainApp()));
}

