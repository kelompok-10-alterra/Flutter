import 'package:flutter/material.dart';
import 'package:kelompok_10/theme/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: primaryColor,
      ),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
        ),
      ),
    );
  }
}
