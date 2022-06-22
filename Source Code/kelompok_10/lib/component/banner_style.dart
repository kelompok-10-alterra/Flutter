import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BannerStyle extends StatelessWidget {
  const BannerStyle({
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
      padding: EdgeInsets.only(
        top: defaultMargin,
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
              padding: const EdgeInsets.only(
                top: 6.0,
                left: 12.0,
                right: 12.0,
                bottom: 12.0,
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
                            fontSize: 18.0,
                            fontWeight: semiBold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          discount,
                          style: whiteTextStyle.copyWith(
                            fontSize: 28.0,
                            fontWeight: semiBold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          date,
                          style: whiteTextStyle.copyWith(
                            fontSize: 12.0,
                            fontWeight: regular,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
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
