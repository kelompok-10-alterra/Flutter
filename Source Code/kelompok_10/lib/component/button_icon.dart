import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kelompok_10/theme/theme.dart';

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon({
    Key? key,
    this.icons,
    required this.press,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius,
  }) : super(key: key);
  final String? icons;
  final Function press;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.0,
      height: 54.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
        color: backgroundColor ?? primaryColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: iconColor ?? whiteColor,
          backgroundColor: transparentColor,
        ),
        onPressed: press as void Function()?,
        child: SvgPicture.asset(
          icons ?? 'assets/svg/ic-home.svg',
          fit: BoxFit.cover,
          color: iconColor ?? whiteColor,
        ),
      ),
    );
  }
}
