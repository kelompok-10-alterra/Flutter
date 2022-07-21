import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  @override
  Widget build(BuildContext context) {
    bool isFavorited = false;
    return IconButton(
      splashColor: transparentColor,
      highlightColor: transparentColor,
      icon: Icon(
        isFavorited == false ? Icons.share_outlined : Icons.share_rounded,
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
