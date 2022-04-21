import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo/todo_home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: TodoHomeScreen())));
}
