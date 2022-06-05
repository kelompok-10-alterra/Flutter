import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;

Size displaySize(BuildContext context) {
  debugPrint('Size = ${MediaQuery.of(context).size}');
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ${displaySize(context).height}');
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ${displaySize(context).width}');
  return displaySize(context).width;
}

Color primaryColor = const Color(0xffFC8955);
Color secondaryColor = const Color(0xffFDD485);
Color greyColor = const Color(0xffA8AAA9);
Color titleColor = const Color(0xffD0D1D1);
Color whiteColor = const Color(0xffFFFFFF);
Color whiteTwoColor = const Color(0xffEAE5E4);
Color blackColor = const Color(0xff000000);
Color redColor = const Color(0xffE31D20);
Color greenColor = const Color(0xff4CB050);
Color transparentColor = Colors.transparent;

TextStyle primaryTextStyle = GoogleFonts.inter(color: primaryColor);

TextStyle secondaryTextStyle = GoogleFonts.inter(color: secondaryColor);

TextStyle greyTextStyle = GoogleFonts.inter(color: greyColor);

TextStyle titleTextStyle = GoogleFonts.inter(color: titleColor);

TextStyle whiteTextStyle = GoogleFonts.inter(color: whiteColor);

TextStyle redTextStyle = GoogleFonts.inter(color: redColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
