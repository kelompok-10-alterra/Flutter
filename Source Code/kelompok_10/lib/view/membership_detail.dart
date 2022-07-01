import 'package:flutter/material.dart';
import 'package:kelompok_10/component/card_benefit.dart';
import 'package:kelompok_10/component/primary_button.dart';
import 'package:kelompok_10/theme/theme.dart';

import '../component/back_button.dart';
import '../component/card_membership.dart';
import 'payment_method_screen.dart';

class MembershipDetail extends StatelessWidget {
  static const String routeName = '/membership_detail';
  MembershipDetail({Key? key}) : super(key: key);

  final List<String> benefit = [
    'Diskon di setiap pembelian  kelas hingga 20%',
    'Gratis semua fasilitas Gym',
    'Gratis biaya perpanjangan member',
    'Dapatkan point setiap pembelian',
  ];

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
              'Metode Pembayaran',
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
          CardMembership(
            starColor: gradientFiveColor,
            endColor: gradientTwoColor,
            username: 'John Doe',
            id: '123456789',
            membershipType: 'Silver',
            date: 'Berlaku 1 bulan',
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Benefit',
                  style: blackTextStyle.copyWith(
                    fontSize: 18.0,
                    fontWeight: semiBold,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: benefit.map(
                    (item) {
                      return CardBenefit(
                        title: item,
                      );
                    },
                  ).toList(),
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                PrimaryButton(
                  press: () {
                    Navigator.pushNamed(context, PaymentMethod.routeName);
                  },
                  text: 'Bayar Sekarang',
                ),
                SizedBox(
                  height: defaultMargin,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 16.0,
          ),
          content(),
        ],
      ),
    );
  }
}
