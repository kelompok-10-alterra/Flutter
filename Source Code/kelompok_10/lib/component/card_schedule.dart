import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class CardSchedule extends StatelessWidget {
  const CardSchedule({
    Key? key,
    required this.member,
  }) : super(key: key);

  final List<String> member;
  final overlayWidth = 12.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178.0,
      width: displayWidth(context),
      margin:  EdgeInsets.only(
        left: 6.0, right: 6.0,
        bottom:defaultMargin,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: defaultCardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 178.0,
            width: 7.0,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '14:00',
                        style: blackTextStyle.copyWith(
                          fontSize: 28.0,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Besok',
                            style: blackTextStyle.copyWith(
                              fontSize: 12.0,
                              fontWeight: regular,
                            ),
                          ),
                          Text(
                            '07 Jun',
                            style: blackTextStyle.copyWith(
                              fontSize: 12.0,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/ic-location.svg',
                        color: redColor,
                        height: 16.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'Kelas A1',
                        style: greyTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: regular,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      SvgPicture.asset(
                        'assets/svg/ic-person.svg',
                        color: orangeColor,
                        height: 17.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'Dinda Adinda',
                        style: greyTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Kundalini Yoga',
                    style: blackTextStyle.copyWith(
                      fontSize: 16.0,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 32.0,
                          child: Stack(
                            children: List.generate(
                              member.length,
                              (index) => Positioned(
                                left: index * (32.0 - overlayWidth),
                                child: Container(
                                  height: 32.0,
                                  width: 32.0,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: whiteColor,
                                      width: 1.5,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        member[index],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '4/8',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
