/*
 *
 *
 *
 * ----------------
 * | 241030072002 |
 * ----------------
 * Copyright © [2023] KERO CS FLUTTER DEVELOPMENT.
 * All Rights Reserved. For inquiries or permissions, contact  me ,
 * https://www.linkedin.com/in/kerolos-fady-software-engineer/
 *
 * /
 */

import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  final Animation<Offset> slidingAnimation;
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) => SlideTransition(
        position: slidingAnimation,
        child: const Text(
          'Read Free Books',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
