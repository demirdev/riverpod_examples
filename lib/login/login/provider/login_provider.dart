import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';

import '../../authentication/provider/authentication_provider.dart';
import '../models/models.dart';

part 'login_state.dart';

final loginProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  final _authenticationRepository = ref.watch(authenticationRepositoryProvider);
  return LoginStateNotifier(
      authenticationRepository: _authenticationRepository);
});

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(LoginState()) {}

  final AuthenticationRepository _authenticationRepository;

  void onUsernameChanged(String usernameFromUI) {
    final username = Username.dirty(usernameFromUI);
    state = state.copyWith(
        username: username, status: Formz.validate([state.username, username]));
  }

  void onPasswordChanged(String passwordFromUI) {
    final password = Password.dirty(passwordFromUI);
    state = state.copyWith(
        password: password, status: Formz.validate([state.password, password]));
  }

  void onSubmitted() async {
    if (state.status.isValidated) {
      state = state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _authenticationRepository.login(
            username: state.username.value, password: state.password.value);
        state = state.copyWith(status: FormzStatus.submissionSuccess);
      } catch (_) {
        state = state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
