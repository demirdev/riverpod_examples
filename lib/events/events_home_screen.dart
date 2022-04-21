import 'package:flutter/material.dart';
import 'package:riverpod_example_1/events/widgets/event_widget.dart';

class EventsHomeScreen extends StatelessWidget {
  const EventsHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: EventWidget()),
      ),
    );
  }
}
