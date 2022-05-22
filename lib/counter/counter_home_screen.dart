import 'package:flutter/material.dart';

import 'view/counter_page.dart';

class CounterHomeScreen extends StatelessWidget {
  const CounterHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CounterPage(),
      ),
    );
  }
}
