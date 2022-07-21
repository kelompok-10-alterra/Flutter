import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class CardCart extends StatelessWidget {
  const CardCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 127.0,
        width: displayWidth(context),
        margin: const EdgeInsets.only(bottom: 16.0, left: 6.0, right: 6.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: defaultCardShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: displayWidth(context) * 0.3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
                child: Image.asset(
                  'assets/images/human-two.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Body Stretching A',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: semiBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Divider(
                      color: greyFourColor,
                      height: 1,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/ic-clock.svg',
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Expanded(
                              child: Text(
                                '14.00 WIB',
                                style: greyTextStyle.copyWith(
                                  fontSize: 12.0,
                                  fontWeight: regular,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/ic-member.svg',
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Expanded(
                              child: Text(
                                '32 Tersisa',
                                style: greyTextStyle.copyWith(
                                  fontSize: 12.0,
                                  fontWeight: regular,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/ic-deadline.svg',
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Expanded(
                              child: Text(
                                'Dimulai pada 04 April',
                                style: greyTextStyle.copyWith(
                                  fontSize: 12.0,
                                  fontWeight: regular,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
