import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example_1/animated_bottom_navigation_bar/provider/active_tab_provider.dart';
import 'package:riverpod_example_1/animated_bottom_navigation_bar/common/active_tab_name.dart';

class HomeTab extends HookConsumerWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ActiveTabName(),
            TextField(controller: controller),
          ],
        ),
      ),
    );
  }
}
