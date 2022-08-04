import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/active_tab_provider.dart';

class ActiveTabName extends ConsumerWidget {
  const ActiveTabName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTabName = ref.watch(activeTabProvider).name;

    return Text(activeTabName.toUpperCase());
  }
}
