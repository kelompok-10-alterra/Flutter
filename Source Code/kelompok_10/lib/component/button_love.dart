import 'package:flutter/material.dart';

import '../theme/theme.dart';

class LoveButton extends StatefulWidget {
  LoveButton({Key? key}) : super(key: key);

  @override
  State<LoveButton> createState() => _LoveButtonState();
}

class _LoveButtonState extends State<LoveButton> {
  @override
  Widget build(BuildContext context) {
    bool isFavorited = false;
    return IconButton(
      icon: Icon(
        isFavorited == false
            ? Icons.favorite_outline_rounded
            : Icons.favorite_rounded,
        color: primaryColor,
      ),
      onPressed: () {
        setState(
          () {
            isFavorited = !isFavorited;
          },
        );
      },
    );
  }
}
