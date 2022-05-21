import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'timer.dart';

class TimerHomeScreen extends StatelessWidget {
  const TimerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: TimerPage());
  }
}
