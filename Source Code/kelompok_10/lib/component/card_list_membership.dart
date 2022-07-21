import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kelompok_10/model/member_model.dart';

import '../theme/theme.dart';
import '../view/membership_detail.dart';
import 'small_button_orange.dart';

class CardListMembership extends StatelessWidget {
  const CardListMembership({
    Key? key,
    required this.starColor,
    required this.endColor,
    required this.starPrice,
    required this.member,
  }) : super(key: key);

  final Color starColor;
  final Color endColor;
  final String starPrice;

  final MemberModel member;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: 16.0,
      ),
      width: displayWidth(context),
      height: 175.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            starColor,
            endColor,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 54.0,
                    width: 54.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: whiteColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/ic-card.svg',
                      color: starColor,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name!,
                        style: whiteTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        member.period!,
                        style: whiteTextStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              height: 1.0,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    starColor,
                    whiteColor,
                    endColor,
                  ],
                  stops: const [
                    -0.1,
                    0.5,
                    1.0,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rp. $starPrice",
                        style: whiteTextStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: light,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: redColor,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "RP. ${member.price}",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 64.0,
                    child: SmallOrangeButton(
                      press: () {
                        Navigator.pushNamed(
                          context,
                          MembershipDetail.routeName,
                          arguments: member,
                        );
                      },
                      text: 'Beli',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
