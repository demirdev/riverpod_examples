import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/animated_bottom_navigation_bar/view/bell_tab.dart';
import 'package:riverpod_example_1/animated_bottom_navigation_bar/view/happy_star_tab.dart';
import 'package:riverpod_example_1/animated_bottom_navigation_bar/view/home_tab.dart';

import 'common/custom_lottie_icon.dart';
import 'provider/active_tab_provider.dart';

class AnimatedBottomNavigationBarScreen extends ConsumerWidget {
  AnimatedBottomNavigationBarScreen({Key? key}) : super(key: key);

  final List<Widget> _tabs = [
    HomeTab(),
    HappyStarTab(),
    BellTab(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = ref.watch(activeTabProvider);
    final currentTabIndex = Tabs.values.indexOf(activeTab);
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentTabIndex,
          children: _tabs,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        items: Tabs.values.map((e) {
          return BottomNavigationBarItem(
              icon: CustomLottieIcon(e), label: e.name);
        }).toList(),
        onTap: (index) =>
            ref.read(activeTabProvider.notifier).state = Tabs.values[index],
      ),
    );
  }
}

enum Tabs {
  home,
  happy_star,
  bell,
}
