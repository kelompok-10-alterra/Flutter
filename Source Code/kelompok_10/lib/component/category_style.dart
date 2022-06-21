import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CategoryStyle extends StatelessWidget {
  const CategoryStyle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.23),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/human-two.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Yoga',
          style: blackTextStyle.copyWith(
              fontSize: 14.0,
              fontWeight: semiBold,
              color: Colors.white,
              overflow: TextOverflow.ellipsis),
          maxLines: 1,
        ),
      ),
    );
  }
}
