// import 'package:flutter/material.dart';

import 'package:riverpod/riverpod.dart';

final myAutoDisposeProvider = Provider.autoDispose<int>((ref) {
  return 10;
});

final myFamilyProvider = Provider.family<String, int>((ref, id) {
  return '$id';
});

final helloWorldProvider = Provider((ref) => 'Hello World!');

final greetingProvider = Provider<String>((ref) {
  return 'Greetings';
});

void main() {
  // runApp(const MyApp());

  final container = ProviderContainer();

  print(container.read(helloWorldProvider));
  print(container.read(greetingProvider));
  print(container.read(myFamilyProvider(2022)));
}
