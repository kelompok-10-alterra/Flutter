import 'package:flutter/material.dart';

import 'package:kelompok_10/component/card_benefit.dart';
import 'package:kelompok_10/component/primary_button.dart';
import 'package:kelompok_10/model/member_model.dart';
import 'package:kelompok_10/theme/theme.dart';
import 'package:provider/provider.dart';

import '../component/back_button.dart';
import '../component/card_membership.dart';
import '../view_model/auth_view_model.dart';
import 'Payment_Membership/payment_screen.dart';

class MembershipDetail extends StatelessWidget {
  static const String routeName = '/membership_detail';
  MembershipDetail({
    Key? key,
    required this.member,
  }) : super(key: key);

  final MemberModel member;

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
              'Silver',
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
        return ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            CardMembership(
              starColor: member.memberId == 1
                  ? gradientTwoColor
                  : member.memberId == 2
                      ? gradientPurpleOneColor
                      : gradientBrownOneColor,
              endColor: member.memberId == 1
                  ? gradientFiveColor
                  : member.memberId == 2
                      ? gradientPurpleTwoColor
                      : gradientBrownTwoColor,
              member: member,
              user: state.user,
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
                ],
              ),
            ),
          ],
        );
      });
    }

    Widget bottomBar() {
      return Container(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 16.0,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.15),
              spreadRadius: 1,
              offset: const Offset(0, 1),
              blurRadius: 7,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              press: () {
                Navigator.pushNamed(context, PaymentScreen.routeName,
                    arguments: member);
              },
              text: 'Bayar Sekarang',
            ),
            SizedBox(
              height: defaultMargin,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
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
      bottomNavigationBar: bottomBar(),
    );
  }
}
