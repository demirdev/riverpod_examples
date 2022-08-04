import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/active_tab_provider.dart';
import '../common/active_tab_name.dart';

class BellTab extends HookConsumerWidget {
  const BellTab({Key? key}) : super(key: key);

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
