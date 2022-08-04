import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/animated_bottom_navigation_bar/animated_bottom_navigation_bar_screen.dart';
import 'package:riverpod_example_1/counter/counter_home_screen.dart';
import 'package:riverpod_example_1/events/events_home_screen.dart';
import 'package:riverpod_example_1/login/login_app.dart';
import 'package:riverpod_example_1/login/login_main.dart';
import 'package:riverpod_example_1/store/store_home_screen.dart';
import 'package:riverpod_example_1/timer/timer_home_screen.dart';

import 'infinite_list/infinite_list_home_screen.dart';
import 'todo/todo_home_screen.dart';

void main() {
  // runApp(const ProviderScope(
  //     child: MaterialApp(
  //   /// Riverpod Examples
  //
  //   /// StreamProvider
  //   // home: EventsHomeScreen(),
  //
  //   /// FutureProvider
  //   // home: StoreHomeScreen(),
  //
  //   /// StateNotifierProvider
  //   // home: TodoHomeScreen(),
  //
  //   /// StateNotifierProvider
  //   // home: TimerHomeScreen(),
  //
  //   /// StateNotifierProvider
  //   //home: CounterHomeScreen(),
  //
  //   /// StateNotifierProvider
  //   home: InfiniteListHomeScreen(),
  //
  //   ///
  // )));

  /// for Login example comment out lines below
  // runApp(const ProviderScope(child: LoginMain()));

  runApp(ProviderScope(
      child: MaterialApp(home: AnimatedBottomNavigationBarScreen())));
}
