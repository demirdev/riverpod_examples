import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../bloc/login.dart';

class LoginFrom extends ConsumerWidget {
  const LoginFrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginProvider, (previous, state) {
      if (state.status.isSubmissionFailure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')));
      }
    });
    return Column(
      children: const [
        _UsernameInput(),
        Padding(padding: EdgeInsets.all(12)),
        _PasswordInput(),
        Padding(padding: EdgeInsets.all(12)),
        _LoginButton(),
      ],
    );
  }
}

class _UsernameInput extends ConsumerWidget {
  const _UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _username =
        ref.watch(loginProvider.select((value) => value.username));

    return TextField(
      key: const Key('loginForm_usernameInput_textfield'),
      onChanged: (username) =>
          ref.read(loginProvider.notifier).onUsernameChanged(username),
      decoration: InputDecoration(
          labelText: 'username',
          errorText: _username.invalid ? 'invalid username' : null),
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _password =
        ref.watch(loginProvider.select((value) => value.password));

    return TextField(
      key: const Key('loginForm_passwordInput_textfield'),
      onChanged: (password) =>
          ref.read(loginProvider.notifier).onPasswordChanged(password),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'password',
        errorText: _password.invalid ? 'invalid password' : null,
      ),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _status = ref.watch(loginProvider.select((value) => value.status));
    return _status.isSubmissionInProgress
        ? CircularProgressIndicator()
        : ElevatedButton(
            key: const Key('loginForm_continue_raisedButton'),
            onPressed: _status.isValidated
                ? () {
                    ref.read(loginProvider.notifier).onSubmitted();
                  }
                : null,
            child: Text('Login'));
  }
}
