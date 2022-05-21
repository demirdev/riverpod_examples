import 'package:flutter/material.dart';

import 'timer_actions.dart';
import 'timer_text.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Stack(
        children: [
          //,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              TimerText(),
              Spacer(),
              TimerActions(),
              Spacer(),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
