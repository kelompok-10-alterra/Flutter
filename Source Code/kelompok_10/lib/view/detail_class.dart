import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kelompok_10/animation/shimmer_effect.dart';
import 'package:kelompok_10/component/button_love.dart';
import 'package:kelompok_10/component/button_share.dart';
import 'package:kelompok_10/component/primary_button.dart';
import 'package:kelompok_10/theme/theme.dart';
import 'package:readmore/readmore.dart';

import '../component/back_button.dart';
import '../component/small_button.dart';

class DetailClass extends StatelessWidget {
  static const routeName = '/detail-class';
  const DetailClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: displayHeight(context) * 0.4,
        width: displayWidth(context),
        decoration: BoxDecoration(
          color: primaryColor,
          image: const DecorationImage(
            image: AssetImage('assets/images/human-two.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: BackButtons(
              color: blackColor.withOpacity(0.1),
            ),
          ),
        ),
      );
    }

    Widget namaClass() {
      return Padding(
        padding: EdgeInsets.only(
          top: 12.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Full Body Stretching',
                style: blackTextStyle.copyWith(
                  fontSize: 22.0,
                  fontWeight: semiBold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Row(
              children: const [
                ShareButton(),
                LoveButton(),
              ],
            )
          ],
        ),
      );
    }

    Widget prices() {
      return Padding(
        padding: EdgeInsets.only(
          top: 4.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rp. 90.000',
                  style: blackTextStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: redColor,
                    fontSize: 12.0,
                    fontWeight: light,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Rp. 35.000',
                  style: blackTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SmallButton(),
                SizedBox(
                  width: 8.0,
                ),
                SmallButton(),
              ],
            )
          ],
        ),
      );
    }

    Widget mentor() {
      return Padding(
        padding: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 32.0,
                        width: 32.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/human-three.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: ShimmerEffect(
                          child: Text(
                            'Mentor',
                            style: greyTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: medium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16.0,
                      child: Image.asset('assets/images/ic-star.png'),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '4.5',
                      style: greyTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    SizedBox(
                      height: 16.0,
                      child: SvgPicture.asset('assets/svg/ic-clock.svg'),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '45 Menit',
                      style: greyTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Divider(
              color: blueColor,
              thickness: 1.0,
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Padding(
        padding: EdgeInsets.only(
          top: 16.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi',
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ReadMoreText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: greyTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: regular,
              ),
              textAlign: TextAlign.justify,
              trimLines: 3,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Baca selengkapnya',
              trimExpandedText: 'Tampilkan lebih sedikit',
              moreStyle: primaryTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        color: transparentColor,
        child: PrimaryButton(
          press: () {},
          text: 'Cek ketersediaan',
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: button(),
      extendBody: true,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          header(),
          namaClass(),
          prices(),
          mentor(),
          description(),
        ],
      ),
    );
  }
}
