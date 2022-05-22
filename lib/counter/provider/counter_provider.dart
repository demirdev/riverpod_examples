import 'package:riverpod/riverpod.dart';

final counterProvider = StateNotifierProvider((ref) => CounterStateNotifier());

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier([int? state]) : super(state ?? 0);

  void increment() => state += 1;
  void decrement() => state -= 1;
}
