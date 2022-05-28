import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_state.dart';

final authenticationRepositoryProvider =
    Provider<AuthenticationRepository>((ref) => AuthenticationRepository());

final authenticationProvider =
    StateNotifierProvider<AuthenticationStateNotifier, AuthenticationState>(
        (ref) {
  final _authenticationRepository = ref.watch(authenticationRepositoryProvider);
  return AuthenticationStateNotifier(
      authenticationRepository: _authenticationRepository,
      userRepository: UserRepository());
});

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationStateNotifier(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(AuthenticationState.unknown()) {
    _authenticationStreamSubscription =
        _authenticationRepository.status.listen((status) {
      _authenticationStatusChanged(status);
    });
  }

  late StreamSubscription<AuthenticationStatus>
      _authenticationStreamSubscription;
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  void _authenticationStatusChanged(AuthenticationStatus status) async {
    switch (status) {
      case AuthenticationStatus.unknown:
        state = const AuthenticationState.unknown();
        break;
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        state = user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated();
        break;
      case AuthenticationStatus.unauthenticated:
        state = const AuthenticationState.unauthenticated();
    }
  }

  void logout() async {
    _authenticationRepository.logout();
  }

  @override
  void dispose() {
    _authenticationStreamSubscription.cancel();
    _authenticationRepository.dispose();
    super.dispose();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
