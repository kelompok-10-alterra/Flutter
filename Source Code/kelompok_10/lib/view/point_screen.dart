import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../component/back_button.dart';
import '../component/banner_style_point.dart';
import '../component/card_gridview.dart';
import '../theme/theme.dart';
import '../view_model/auth_view_model.dart';

class PointScreen extends StatelessWidget {
  static const routeName = '/point-screen';
  const PointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackButtons(
              height: 40.0,
              width: 40.0,
            ),
            Text(
              'Point',
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
      return Consumer<AuthViewModel>(builder: (context, state, _) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin - 6),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 16.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                width: displayWidth(context),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: whiteColor,
                  boxShadow: defaultCardShadow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Points',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: semiBold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: blueColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/ic-total-point.svg',
                            color: primaryColor,
                            height: 20.0,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            state.user.point.toString(),
                            style: primaryTextStyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  'Cara mendapatkan point',
                  style: blackTextStyle.copyWith(
                    fontSize: 18.0,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: BannerStylePoint(
                  image: 'assets/images/banner-one.png',
                  title: 'Beli Kelas\ndan dapatkan',
                  discount: '10%',
                  date: 'Berlaku sampai 30 Juni 2020',
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  'Kelas favorit',
                  style: blackTextStyle.copyWith(
                    fontSize: 18.0,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 237.0,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox();
                    // CardGridView();
                  },
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
            ],
          ),
        );
      });
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: whiteColor,
      body: content(),
    );
  }
}
