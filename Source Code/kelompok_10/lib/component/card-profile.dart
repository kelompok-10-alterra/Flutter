import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    Key? key,
    required this.icons,
    required this.title,
  }) : super(key: key);

  final String icons;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      width: displayWidth(context),
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: 16.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: defaultCardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 32,
                width: 32,
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: blueColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icons,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 14.0,
              ),
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 14.0,
          ),
          SvgPicture.asset('assets/svg/ic-arrow-right.svg'),
        ],
      ),
    );
  }
}
