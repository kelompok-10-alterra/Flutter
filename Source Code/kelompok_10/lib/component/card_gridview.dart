import 'package:flutter/material.dart';
import 'package:kelompok_10/component/button_love.dart';
import 'package:kelompok_10/component/small_button.dart';

import '../theme/theme.dart';

class CardGridView extends StatelessWidget {
  const CardGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      height: 275.0,
      width: displayWidth(context) * 0.5,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.23),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(
              0,
              0,
            ), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            height: 150.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/human-two.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SmallButton(),
                  LoveButton(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Body Stretching',
                  style: blackTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  '45 Menit | Menengah',
                  style: blackTextStyle.copyWith(
                    fontSize: 12.0,
                    fontWeight: medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Rp. 30.000',
                        style: redTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: semiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      'Online',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.0,
                        fontWeight: medium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
