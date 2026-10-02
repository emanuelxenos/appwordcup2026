import 'package:appwordcup2026/core/auth/auth_session_notifier.dart';
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


GoRouter router(AuthSessionNotifier session)=> GoRouter(
  initialLocation: Routes.splash,
  refreshListenable: session,
  redirect: (_, state) {
    final destination = state.matchedLocation;

    if(destination == Routes.splash) return null;

    if(!session.isRestored) return null;

    final isPublic = Routes.public.contains(destination);

    if(!session.isSignedIn) return isPublic ? null : Routes.login;
    
    return isPublic ? Routes.home : null;
  },
  routes: [
    GoRoute(path: Routes.splash, builder: (context, _) => SplashScreen(sessionNotifier: context.read(),)),
    GoRoute(path: Routes.welcome, builder: (_, _) => WelcomeScreen()),
    GoRoute(path: Routes.login, builder: (_, _) => LoginBindings(screenBuilder: (context) {
      return LoginScreen(viewmodel: context.read());
    },)),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen(name: state.extra as String? ?? ''),),
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