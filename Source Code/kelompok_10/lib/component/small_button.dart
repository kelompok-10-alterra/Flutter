import 'package:flutter/material.dart';

import '../theme/theme.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      height: 22,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            gradientOneColor,
            gradientTwoColor,
          ],
        ),
        borderRadius:
            BorderRadius.circular(100.0),
      ),
      child: Center(
        child: Text(
          'Promo',
          style: whiteTextStyle.copyWith(
            fontSize: 12.0,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}