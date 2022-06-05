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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      height: displayHeight(context),
      width: displayWidth(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            images,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
