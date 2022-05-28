import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/provider/authentication_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userId =
        ref.watch(authenticationProvider.select((value) => value.user.id));
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          children: [
            Text('userId: $_userId'),
            ElevatedButton(
              onPressed: () {
                ref.read(authenticationProvider.notifier).logout();
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }

  static Route route() => MaterialPageRoute(builder: (_) => HomePage());
}
