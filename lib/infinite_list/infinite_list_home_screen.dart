import 'package:flutter/material.dart';

import 'posts/view/posts_page.dart';

class InfiniteListHomeScreen extends StatelessWidget {
  const InfiniteListHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PostsPage(),
      ),
    );
  }
}
