import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/events/events_home_screen.dart';
import 'package:riverpod_example_1/store/store_home_screen.dart';
import 'package:riverpod_example_1/timer/timer_home_screen.dart';

import 'todo/todo_home_screen.dart';

void main() {
  runApp(const ProviderScope(
      child: MaterialApp(
    /// Riverpod Examples

    /// StreamProvider
    // home: EventsHomeScreen(),

    /// FutureProvider
    // home: StoreHomeScreen(),

    /// StateNotifierProvider
    // home: TodoHomeScreen(),

    /// StateNotifierProvider
    home: TimerHomeScreen(),

    ///
  )));
}
