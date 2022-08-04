import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_example_1/animated_bottom_navigation_bar/animated_bottom_navigation_bar_screen.dart';
import 'package:riverpod_example_1/animated_bottom_navigation_bar/provider/active_tab_provider.dart';

class CustomLottieIcon extends HookConsumerWidget {
  final Tabs e;
  const CustomLottieIcon(
    this.e, {
    Key? key,
  }) : super(key: key);

  final iconWidth = 50.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller =
        useAnimationController(duration: const Duration(seconds: 1));

    final isActive = ref.read(activeTabProvider) == e;

    useEffect(() {
      if (isActive) {
        _controller.forward();
      } else {
        _controller.reset();
      }
    });

    return Lottie.asset(
      'assets/${e.name}.json',
      width: iconWidth,
      controller: _controller,
      onLoaded: (composition) {},
    );
  }
}
