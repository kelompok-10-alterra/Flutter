import 'package:flutter/material.dart';

import '../theme/theme.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    Key? key,
    required this.currentIndex,
    required this.index,
  }) : super(key: key);

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      width: currentIndex == index ? 16.0 : 6.0,
      height: 6.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: currentIndex == index
            ? whiteColor.withAlpha(185)
            : whiteColor.withAlpha(185),
      ),
    );
  }
}
