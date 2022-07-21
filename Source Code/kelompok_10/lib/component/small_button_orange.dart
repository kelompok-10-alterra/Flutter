import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompok_10/theme/theme.dart';

class SmallOrangeButton extends StatelessWidget {
  const SmallOrangeButton({
    Key? key,
    this.text,
    required this.press,
  }) : super(key: key);
  final String? text;
  // ignore: non_constant_identifier_names
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 32.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: orangeColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: transparentColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text ?? 'Button',
          style: whiteTextStyle.copyWith(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 12,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
