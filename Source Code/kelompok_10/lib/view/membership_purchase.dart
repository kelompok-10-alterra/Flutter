import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kelompok_10/theme/theme.dart';

import '../component/back_button.dart';
import '../component/card_list_membership.dart';
import '../component/card_membership.dart';
import '../component/small_button_orange.dart';

class MembershipPurchase extends StatelessWidget {
  static const String routeName = '/membership_purchase';
  const MembershipPurchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: EdgeInsets.only(
          top: 32.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackButtons(
              height: 40.0,
              width: 40.0,
            ),
            Text(
              'Membership',
              style: blackTextStyle.copyWith(
                fontSize: 20.0,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              width: 40,
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          CardListMembership(
            starColor: gradientTwoColor,
            endColor: gradientFiveColor,
            typeCard: 'Silver',
            berlaku: 'Berlaku 1 bulan',
            starPrice: '100.000',
            discountPrice: '20.000',
          ),
          CardListMembership(
            starColor: gradientPurpleOneColor,
            endColor: gradientPurpleTwoColor,
            typeCard: 'Gold',
            berlaku: 'Berlaku 3 bulan',
            starPrice: '250.000',
            discountPrice: '40.000',
          ),
          CardListMembership(
            starColor: gradientBrownOneColor,
            endColor: gradientBrownTwoColor,
            typeCard: 'Platinum',
            berlaku: 'Berlaku 6 bulan',
            starPrice: '350.000',
            discountPrice: '60.000',
          ),
        ],
      );
    }

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          header(),
          const SizedBox(
            height: 16.0,
          ),
          content(),
        ],
      ),
    );
  }
}
