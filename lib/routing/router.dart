import 'package:appwordcup2026/routing/routes.dart';
import 'package:appwordcup2026/ui/auth/login/login_bindings.dart';
import 'package:appwordcup2026/ui/auth/login/login_screen.dart';
import 'package:appwordcup2026/ui/auth/register/register_bindings.dart';
import 'package:appwordcup2026/ui/auth/register/register_screen.dart';
import 'package:appwordcup2026/ui/home/home_screen.dart';
import 'package:appwordcup2026/ui/splash/splash_screen.dart';
import 'package:appwordcup2026/ui/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


GoRouter router() => GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (_, _) => SplashScreen()),
    GoRoute(path: Routes.welcome, builder: (_, _) => WelcomeScreen()),
    GoRoute(path: Routes.login, builder: (_, _) => LoginBindings(screenBuilder: (context) {
      return LoginScreen(viewmodel: context.read());
    },)),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen(name: state.extra as String),),
    GoRoute(
    path: Routes.register,
    builder: (_, _) => RegisterBindings(
      screenBuilder: (context) => RegisterScreen(
        viewModel: context.read(),
      ),
    ),
  ),
  ],
);