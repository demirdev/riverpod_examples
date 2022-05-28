import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication/provider/authentication_provider.dart';
import 'home/view/home_page.dart';
import 'login/view/login_page.dart';
import 'splash/view/splash_page.dart';

class LoginAppView extends ConsumerStatefulWidget {
  const LoginAppView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginAppView> createState() => _LoginAppViewState();
}

class _LoginAppViewState extends ConsumerState<LoginAppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthenticationState>(authenticationProvider, (previous, state) {
      switch (state.status) {
        case AuthenticationStatus.unknown:
          break;
        case AuthenticationStatus.authenticated:
          _navigator.pushAndRemoveUntil(HomePage.route(), (route) => false);
          break;
        case AuthenticationStatus.unauthenticated:
          _navigator.pushAndRemoveUntil(LoginPage.route(), (route) => false);
          break;
      }
    });
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
