import 'package:appwordcup2026/routing/routes.dart';
import 'package:appwordcup2026/ui/auth/login/login_screen.dart';
import 'package:appwordcup2026/ui/splash/splash_screen.dart';
import 'package:appwordcup2026/ui/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';


GoRouter router() => GoRouter(
  initialLocation: Routes.login,
  routes: [
    GoRoute(path: Routes.splash, builder: (_, _) => SplashScreen()),
    GoRoute(path: Routes.welcome, builder: (_, _) => WelcomeScreen()),
    GoRoute(path: Routes.login, builder: (_, _) => LoginScreen()),
  ],
);