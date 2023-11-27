import 'package:cashir/navigation/transition_animation.dart';
import 'package:cashir/presentation/auth/view/login.dart';
import 'package:cashir/presentation/home/view/home.dart';
import 'package:go_router/go_router.dart';

import '../constants/destinations.dart';
import '../presentation/auth/view/register.dart';
import '../presentation/welcome/welcome.dart';

class Navigation {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Destination.welcome,
        builder: (context, state) =>  const WelcomeScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const WelcomeScreen(),
        ),
      ),
      GoRoute(
        path: Destination.register,
        builder: (context, state) => const RegisterScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: Destination.login,
        builder: (context, state) => const LoginScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Destination.home,
        builder: (context, state) => const HomeScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
    ],
  );
}