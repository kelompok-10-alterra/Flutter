import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class CardBenefit extends StatelessWidget {
  const CardBenefit({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: displayWidth(context),
      padding: const EdgeInsets.all(14.0),
      margin: const EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: greyTwoColor.withOpacity(0.15),
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 44.0,
            width: 44.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: blueColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/ic-like.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Expanded(
            child: Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: medium,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
