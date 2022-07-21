import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class CardListBarang extends StatelessWidget {
  const CardListBarang({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      width: displayWidth(context),
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 44.0,
            width: 44.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: blueTwoColor,
            ),
            child: SvgPicture.asset(
              'assets/svg/ic-card.svg',
              color: primaryColor,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontSize: 14.0,
              fontWeight: semiBold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
