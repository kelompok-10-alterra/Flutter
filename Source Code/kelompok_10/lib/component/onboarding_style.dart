import 'package:flutter/material.dart';

import '../theme/theme.dart';

class OnBoardingStyle extends StatelessWidget {
  const OnBoardingStyle({
    Key? key,
    required this.images,
    required this.title,
  }) : super(key: key);

  final String images;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            images,
            height: displayHeight(context) * 0.5,
          ),
          SizedBox(height: defaultMargin),
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
