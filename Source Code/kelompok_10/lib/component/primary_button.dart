import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kelompok_10/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.text,
    this.withIcon = false,
    this.icons,
    required this.press,
    this.backgroundColor,
    this.textColor,
    this.fontSized,
    this.borderRadius,
  }) : super(key: key);
  final String? text;
  final bool withIcon;
  final String? icons;
  final Function press;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSized;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
        color: backgroundColor ?? primaryColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: textColor ?? whiteColor,
          backgroundColor: transparentColor,
        ),
        onPressed: press as void Function()?,
        child: withIcon == false
            ? Text(
                text ?? 'Button',
                style: whiteTextStyle.copyWith(
                  fontSize: fontSized ?? 16.0,
                  fontWeight: medium,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icons ?? 'assets/svg/ic-home.svg',
                    fit: BoxFit.cover,
                    color: textColor ?? whiteColor,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    text ?? 'Button',
                    style: whiteTextStyle.copyWith(
                      color: textColor ?? whiteColor,
                      fontSize: fontSized ?? 16.0,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
