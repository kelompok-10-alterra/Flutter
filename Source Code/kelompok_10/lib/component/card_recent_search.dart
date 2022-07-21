import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CardRecentSearch extends StatelessWidget {
  const CardRecentSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      width: displayWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
                width: 50.0,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/human-three.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kundalini Yoga | Online',
                    style: greyTextStyle.copyWith(
                      fontSize: 16.0,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    '2 jam yang lalu',
                    style: greyTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: regular,
                    ),
                  ),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close_rounded,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
