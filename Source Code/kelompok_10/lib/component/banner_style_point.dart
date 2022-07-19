import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BannerStylePoint extends StatelessWidget {
  const BannerStylePoint({
    Key? key,
    required this.image,
    required this.title,
    required this.discount,
    required this.date,
  }) : super(key: key);

  final String image;
  final String title;
  final String discount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Container(
        height: 120.0,
        width: displayWidth(context) * 0.87,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          // Radial Gradient
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              gradientOneColor,
              gradientTwoColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  'assets/images/banner-one.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 12.0,
                left: defaultMargin,
                right: displayWidth(context) * 0.5,
                bottom: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16.0,
                            fontWeight: medium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        SizedBox(
                          height: 30.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  discount,
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 28.0,
                                    fontWeight: semiBold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Expanded(
                                child: Text(
                                  'points',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14.0,
                                    fontWeight: medium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
