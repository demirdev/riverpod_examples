import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../animated_bottom_navigation_bar_screen.dart';

final activeTabProvider = StateProvider<Tabs>((ref) => Tabs.home);
