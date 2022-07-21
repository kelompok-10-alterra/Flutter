import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import 'package:kelompok_10/component/button_love.dart';
import 'package:kelompok_10/component/button_share.dart';
import 'package:kelompok_10/component/primary_button.dart';
import 'package:kelompok_10/model/class_model.dart';
import 'package:kelompok_10/theme/theme.dart';

import '../component/back_button.dart';
import '../component/small_button.dart';
import '../view_model/class_view_model.dart';

class DetailClass extends StatelessWidget {
  static const routeName = '/detail-class';
  DetailClass({
    Key? key,
    this.classModel,
  }) : super(key: key);

  final ClassModel? classModel;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Consumer<ClassViewModel>(builder: (context, state, _) {
        return Container(
          height: displayHeight(context) * 0.4,
          width: displayWidth(context),
          decoration: BoxDecoration(
            color: greyTwoColor.withOpacity(0.2),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Image.network(
                  classModel?.imageUrl ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/il-empty.svg'),
                          const SizedBox(height: 20.0),
                          Text(
                            'Yah Gambarnya Gak Ada',
                            style: blackTextStyle.copyWith(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(defaultMargin),
                  child: BackButtons(
                    color: blackColor.withOpacity(0.1),
                  ),
                ),
              ),
            ],
          ),
        );
      });
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
                classModel?.name ?? 'Nama Tidak Diketahui',
                style: blackTextStyle.copyWith(
                  fontSize: 22.0,
                  fontWeight: semiBold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
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
                // Text(
                //   'Rp. 90.000',
                //   style: blackTextStyle.copyWith(
                //     decoration: TextDecoration.lineThrough,
                //     decorationColor: redColor,
                //     fontSize: 12.0,
                //     fontWeight: light,
                //   ),
                // ),
                // const SizedBox(
                //   height: 4.0,
                // ),
                Text(
                  'Rp. ${classModel?.price}',
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
                        child: Text(
                          classModel?.instructureName ??
                              'Nama Mentor Tidak Diketahui',
                          style: greyTextStyle.copyWith(
                            fontSize: 14.0,
                            fontWeight: semiBold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
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
                      classModel?.rating.toString() ?? '0',
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
                      '${classModel?.hour} jam',
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
              classModel?.description ?? 'Deskripsi Tidak Diketahui',
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
          text: 'Beli Sekarang',
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
