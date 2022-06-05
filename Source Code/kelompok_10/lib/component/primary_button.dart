import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompok_10/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: primaryColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: transparentColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: whiteTextStyle.copyWith(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}