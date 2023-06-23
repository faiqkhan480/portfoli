import 'package:flutter/material.dart';

class ScrollWrapper extends StatelessWidget {
  const ScrollWrapper({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double screenWidth = 800;

    return SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      // controller: scrollController,
      padding: const EdgeInsets.only(top: 100),
      child: Center(
        child: SizedBox(
          width: screenWidth,
          child: child,
        ),
      ),
    );
  }
}
