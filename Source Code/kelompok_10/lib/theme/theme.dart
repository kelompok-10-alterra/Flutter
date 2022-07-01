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

Color primaryColor = const Color(0xff0583D2);
Color orangeColor = const Color(0xffFC8955);
Color secondaryColor = const Color(0xffFDD485);
Color greyColor = const Color(0xff7A7C7C);
Color greyTwoColor = const Color(0xffBBBBBB);
Color greyThreeColor = const Color(0xffEAEAEA);
Color titleColor = const Color(0xffD0D1D1);
Color whiteColor = const Color(0xffFFFFFF);
Color whiteTwoColor = const Color(0xffF6F6F6);
Color blackColor = const Color(0xff292B41);
Color redColor = const Color(0xffE31D20);
Color greenColor = const Color(0xff189F00);
Color blueColor = const Color(0xffE8F4FC);
Color transparentColor = Colors.transparent;
Color gradientOneColor = const Color(0xff39A1E2);
Color gradientTwoColor = const Color(0xff0583D2);
Color gradientThreeColor = const Color(0xff56B5F1);
Color gradientFourColor = const Color(0xff43A4E1);
Color gradientFiveColor = const Color(0xff51B1EE);
Color gradientPurpleOneColor = const Color(0xff986CD0);
Color gradientPurpleTwoColor = const Color(0xffCEA6FF);
Color gradientBrownOneColor = const Color(0xff767676);
Color gradientBrownTwoColor = const Color(0xffB2ACAC);

TextStyle primaryTextStyle = GoogleFonts.inter(color: primaryColor);

TextStyle secondaryTextStyle = GoogleFonts.inter(color: secondaryColor);

TextStyle greyTextStyle = GoogleFonts.inter(color: greyColor);

TextStyle greyTwoTextStyle = GoogleFonts.inter(color: greyTwoColor);

TextStyle titleTextStyle = GoogleFonts.inter(color: titleColor);

TextStyle whiteTextStyle = GoogleFonts.inter(color: whiteColor);

TextStyle blackTextStyle = GoogleFonts.inter(color: blackColor);

TextStyle redTextStyle = GoogleFonts.inter(color: redColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
