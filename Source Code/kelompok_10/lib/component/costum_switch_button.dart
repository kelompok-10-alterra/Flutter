import 'package:flutter/material.dart';

import 'package:kelompok_10/theme/theme.dart';

class CostumSwitchButton extends StatelessWidget {
  CostumSwitchButton({
    Key? key,
    required this.press,
    this.value,
  }) : super(key: key);

  bool? value;
  Function press;

  @override
  Widget build(BuildContext context) {
    final Function onChanged = press;
    return GestureDetector(
      onTap: onChanged as void Function()?,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 32.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 3.0,
          vertical: 3.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: greyTwoColor,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: value != true
              ? Matrix4.translationValues(-7, 0, 0)
              : Matrix4.translationValues(value != true ? -7 : 7, 0, 0),
          curve: Curves.easeInOut,
          height: 12.0,
          width: 12.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
