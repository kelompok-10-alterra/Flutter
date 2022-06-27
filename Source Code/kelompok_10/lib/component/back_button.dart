import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class BackButtons extends StatelessWidget {
  const BackButtons({
    Key? key,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: height ?? 50.0,
        width: width ?? 50.0,
        decoration: BoxDecoration(
          color: color ?? greyThreeColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/svg/ic-back.svg',
            color: primaryColor,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
