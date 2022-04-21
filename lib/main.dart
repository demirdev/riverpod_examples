import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/store/store_home_screen.dart';

import 'todo/todo_home_screen.dart';

void main() {
  runApp(const ProviderScope(
      child: MaterialApp(
    /// Riverpod Examples

    /// FutureProvider
    home: StoreHomeScreen(),

    /// StateNotifierProvider
    // home: TodoHomeScreen(),

    ///
  )));
}
